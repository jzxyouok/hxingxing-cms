<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
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
    public function getIndex()
    {	
        $manageSystem = false;
        if (user('object')->can('manage_system')) {
            $manageSystem = true;
        }
        // $mondayTimestamp = mktime(0, 0, 0, date("n"), date("j") - date("N") + 1);
        $mondayDate = date("j") - date("N") + 1;
        $monthBegin = date('Y-m-01', strtotime(date("Y-m-d")));
        $monthEnd   = date('Y-m-d', strtotime("$monthBegin +1 month -1 day"));
        // var_dump($mondayDate,$monthBegin,$monthEnd);
        
        $articles = DB::table('contents')->join('users', 'users.id', '=', 'contents.user_id')->select(['contents.id','contents.user_id','contents.created_at','users.realname'])->where('contents.created_at','>',$monthBegin)->where('contents.created_at','<',$monthEnd)->get();
        // var_dump($articles);

        $userData = $userFinal = $dataFinal = $weekArticle = [];
        $weekCount = 0;
        $monthCount = count($articles);
        foreach ($articles as $key => $value) {
            $date = substr($value->created_at,8,2);
            if ($date>$mondayDate&&$date<$mondayDate+7) {
                $weekCount ++;
            }
            $userData[$value->realname][$date][] = 1;
        }
        // var_dump($userData);die();
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
        // var_dump($dataFinal);die();
        $dataFinal = json_encode($dataFinal,JSON_UNESCAPED_UNICODE);
    	return view('back.console.index', compact('dataFinal','monthCount','weekCount','manageSystem'));
    }
}
