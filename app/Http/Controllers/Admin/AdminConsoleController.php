<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Douyasi\Models\Opera;
use Douyasi\Models\JobsWant;
/**
 * 后台控制台常规控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminConsoleController extends BackController
{

    /**
     * 后台首页 === 后台控制台概要页面
     *
     * @return Response
     */
    public function getIndex(Request $request)
    {
        $manageSystem = false;
        if (user('object')->can('manage_system')) {
            $manageSystem = true;
        }
        $curMonth = date("Y-m");
        $monthBegin = date('Y-m-01', time());
        $monthEnd   = date('Y-m-d', strtotime("$monthBegin +1 month -1 day"));
        return view('back.console.index', compact('manageSystem','curMonth','monthEnd'));

    }

    public function ajaxArticleCount(){
        // $mondayTimestamp = mktime(0, 0, 0, date("n"), date("j") - date("N") + 1);
        $curMonth = date("Y-m");
        //$mondayDate = date('Y-m-d',mktime(0,0,0,date('m'),date('d')-date('w'),date('Y'))); // 第一天//date("j") - date("N") + 1;
        $month = isset($_POST['month'])?$_POST['month']:$curMonth;
        $monthDate = date('Y-m-d',strtotime($month));
        //var_dump($monthDate,$curMonth);
        $monthBegin = date('Y-m-01', strtotime($monthDate));
        $monthEnd   = date('Y-m-d', strtotime("$monthBegin +1 month -1 day"));
        //var_dump($monthEnd);
        $articles = DB::table('contents')->join('users', 'users.id', '=', 'contents.user_id')->select(['contents.id','contents.user_id','contents.created_at','users.realname'])->where('contents.created_at','>',$monthBegin)->where('contents.created_at','<',$monthEnd.'23:59:59')->get();
        // var_dump($articles);die;
        $dataFinal = $this->dataHandle($articles,$monthEnd);
        $monthCount = count($articles);
        return array('status'=>1,'data'=>$dataFinal,'title'=> $monthCount>0 ? '文章:'.$month.'月统计'.$monthCount.'篇':'文章:暂无数据');
    }

    public function ajaxOperaCount(){
        $curMonth = date("Y-m");
        $month = isset($_POST['month'])?$_POST['month']:$curMonth;
        $monthDate = date('Y-m-d',strtotime($month));
        $monthBegin = date('Y-m-01', strtotime($monthDate));
        $monthEnd   = date('Y-m-d', strtotime("$monthBegin +1 month -1 day"));
        //var_dump($monthEnd);
        $operas = Opera::join('back_users as users', 'users.id', '=', 'operas.created_uid')->select(['operas.id','operas.created_uid','operas.created_at','users.realname'])->where('operas.created_at','>',$monthBegin)->where('operas.created_at','<',$monthEnd.'23:59:59')->get();
        //var_dump($operas);die;
        $dataFinal = $this->dataHandle($operas,$monthEnd);
        $monthCount = count($operas);
        return array('status'=>1,'data'=>$dataFinal,'title'=> $monthCount>0 ? '剧目:'.$month.'月统计'.$monthCount.'篇':'剧目:暂无数据');

    }

    public function ajaxJobsWantCount(){
        $curMonth = date("Y-m");
        $month = isset($_POST['month'])?$_POST['month']:$curMonth;
        $monthDate = date('Y-m-d',strtotime($month));
        $monthBegin = date('Y-m-01', strtotime($monthDate));
        $monthEnd   = date('Y-m-d', strtotime("$monthBegin +1 month -1 day"));
        $jobsWant = jobsWant::join('back_users as users', 'users.id', '=', 'jobs_want.created_uid')->select(['jobs_want.id','jobs_want.created_uid','jobs_want.created_at','users.realname'])->where('jobs_want.created_at','>',$monthBegin)->where('jobs_want.created_at','<',$monthEnd.'23:59:59')->get();
        //var_dump($jobsWant);die;
        $dataFinal = $this->dataHandle($jobsWant,$monthEnd);

        $monthCount = count($jobsWant);

        return array('status'=>1,'data'=>$dataFinal,'title'=> $monthCount>0 ? '应聘名片:'.$month.'月统计'.$monthCount.'篇':'应聘名片:暂无数据');

    }

    private function dataHandle($objectArr,$monthEnd){
        $userData = $userFinal = $dataFinal = [];
        foreach ($objectArr as $key => $value) {
            $date = substr($value->created_at,8,2);
            $userData[$value->realname][$date][] = 1;
        }
        //var_dump($userData);die();
        for ($i=1; $i <substr($monthEnd,8,2)+1 ; $i++) {
            foreach ($userData as $key => $value) {
                if (isset($value[$i])) {
                    $userFinal[$key][] =count($value[$i]);
                }else{
                    $userFinal[$key][] = 0;
                }
            }
        }
        foreach ($userFinal as $key => $value) {
            $dataFinal[] = ['name' => $key,'data' => $value];
        }
        return $dataFinal;
    }
}
