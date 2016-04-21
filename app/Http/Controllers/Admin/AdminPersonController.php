<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\PersonRequest;
use Douyasi\Http\Controllers\Controller;
use Douyasi\Models\Works;
use Illuminate\Http\Request;
use Douyasi\Logger\SystemLogger as SystemLogger;
use Douyasi\Repositories\PersonRepository;
use Cache;

/**
 * （管理型）用户资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminPersonController extends BackController
{


    /**
     * The UserRepository instance.
     *
     * @var Douyasi\Repositories\UserRepository
     */
    protected $person;

    public function __construct(
        PersonRepository $person/*,
        WorksRepository $works*/
    )
    {
        parent::__construct();
        $this->person = $person;
        //$this->works = $works;
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
        //
        $data = [
            'name' => $request->input('s_name'),
            'mobile' => $request->input('s_phone'),
        ];
        $persons = $this->person->index($data, 'manager', Cache::get('page_size', '10'));
        //var_dump($persons);die;
        $serverUrl = 'http://112.74.86.237:8080/img/';
        return view('back.person.index', compact('persons','serverUrl'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
        $roles = $this->person->role();
        return view('back.person.create', ['roles' => $roles]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(PersonRequest $request)
    {
        //
        $data = $request->all();
        $manager = $this->person->store($data, 'manager');
        if ($manager->id) {  //添加成功
            //记录系统日志，这里并未使用事件监听来记录日志
            $log = [
                'uid' => user('id'),
                'type' => 'manager',
                'content' => '管理员：成功新增一名管理用户'.$manager->username.'<'.$manager->email.'>。',
            ];
            SystemLogger::write($log);

            return redirect()->route('admin.person.index')->with('message', '成功新增管理员！');

        } else {
            return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
        }
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        return view('back.person.edit', compact('user', 'roles', 'own_role'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(UserRequest $request, $id)
    {
        //
        $data = $request->all();
        $this->user->update($id, $data, 'manager');

        $log = [
            'user_id' => user('id'),
            'url'=>route('admin.user.edit', $id),
            'type'=>'manager',
            'content'=>'管理员：超级管理员修改了id为'.$id.'的管理用户资料。',
        ];

        SystemLogger::write($log);
        return redirect()->route('admin.user.index')->with('message', '修改管理员成功！');

    }

    public function delWork($workId){
//        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
//            die('权限不足！');
//        }
        //$this->works->delWorkById($workId);
        echo 1;
    }

}
