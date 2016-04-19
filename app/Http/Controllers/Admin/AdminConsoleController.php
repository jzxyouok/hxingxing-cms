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
        $mondayTimestamp = mktime(0, 0, 0, date("n"), date("j") - date("N") + 1);
    	$articles = DB::table('contents')->where('created_at','>',date('Y-m-d H:i:s',$mondayTimestamp))->where('type', 'article')->count();
    	return view('back.console.index', compact('articles', 'articles'));
    }
}
