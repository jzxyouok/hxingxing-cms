<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Cache;
use Douyasi\Extensions\Easemob; //模型仓库层
use Douyasi\Repositories\PersonRepository;
use Session;
/**
 * （管理型）用户资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminMsgController extends BackController
{


    /**
     * The UserRepository instance.
     *
     * @var Douyasi\Repositories\UserRepository
     */
    protected $user;

    public function __construct(
        PersonRepository $person
    )
    {
        parent::__construct();
        $this->person = $person;

        if (! user('object')->can('manage_users')) {
            $this->middleware('deny403');
        }
    }


    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $h = $this->newEasemob();
        $groups = [];
        $count = 0;
        $page= isset($_GET['page'])? (int)$_GET['page']:0;
        $lastButton = $nextButton = true;
        $cursorSession = $request->session()->get('cursor', ['index'=>0,'cursor'=>['']]);
        $index = $cursorSession['index'] = $cursorSession['index']+$page;
        $index += 1;
        if($cursorSession['index'] <= 0){
            $lastButton = false;
        }
        //var_dump($cursorSession);
        $cursor = isset($cursorSession['cursor'][$cursorSession['index']])?$cursorSession['cursor'][$cursorSession['index']]:'';
//        var_dump($cursorSession);//die;
        $timestamp = (strtotime(date('Y-m-d'),time())-6*24*3600)*1000;
        $ql = 'select+*+timestamp>'.$timestamp.'+order+by+timestamp+asc&limit=1000';
        if($cursor) $ql .='&cursor='.$cursor;
        //$time = microtime(true);
        $history= $h->getChatRecord($ql);
        //echo (microtime(true)-$time);
        $hxResult = true;
        if(isset($history['entities'])){
            if($page>=0 && isset($history['cursor'])&&!isset($cursorSession['cursor'][$cursorSession['index']+1])){
                $cursorSession['cursor'][] = $history['cursor'];
            }

            foreach ($history['entities'] as $k => $val) {
                if($val['from'] != 'admin' && $val['to'] != 'admin'){
                    $arr = array(
                        'from'=>substr($val['from'], 0, -1),
                        'to'=>substr($val['to'], 0, -1),
                        'timestamp'=>date('m-d H:i',round($val['timestamp'] / 1000)),
                        'msg'=>isset($val['payload']['bodies'][0]['msg'])?$val['payload']['bodies'][0]['msg']:'',
                    );
                    $person[] = $arr['from'];
                    $person[] = $arr['to'];
                    $return[] = $arr;
                }

            }
            $groups = [];
            $person = array_keys(array_flip($person));
            $person=$this->person->getPersonByIds($person);
            foreach($return as $k=>$v){
                $from = $person[$v['from']]['name'];
                $to = $person[$v['to']]['name'];
                $arr = array('from'=>$from,'timestamp'=>$v['timestamp'],'msg'=>$v['msg']);
                if(isset($groups[$from.'-'.$to])){
                    $groups[$from.'-'.$to][] = $arr;
                    continue;
                }
                if(isset($groups[$to.'-'.$from])){
                    $groups[$to.'-'.$from][] = $arr;
                    continue;
                }
                $groups[$from.'-'.$to][] = $arr;
            }
            //$count = count($return);
            if(!isset($history['cursor'])){
                $nextButton = false;
            }
            //var_dump(session('cursor'));
           //var_dump($groups);
        }else{
            $cursorSession['index'] = $cursorSession['index']-$page;
            //$this->middleware('操作失败，请重试');
            $hxResult = false;
        }
        session(['cursor' => $cursorSession]);
        return view('back.msg.index', compact('groups','lastButton','nextButton','index','hxResult'));

    }


    private function newEasemob() {
        $options['client_id'] = 'YXA6GE-eINUnEeWsSV3hfNAN8Q';
        $options['client_secret'] = 'YXA60AK_25-5gNGQ1D_rUzjZrqnaYsI';
        $options['org_name'] = 'shiheng2015';
        $options['app_name'] = 'hongka';
        return new Easemob($options);
    }

}
