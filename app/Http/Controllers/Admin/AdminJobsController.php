<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\JobsRequest;
use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Douyasi\Logger\SystemLogger as SystemLogger;
use Douyasi\Repositories\JobsRepository;
use Cache;

/**
 * （管理型）用户资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminJobsController extends BackController
{


    /**
     * The UserRepository instance.
     *
     * @var Douyasi\Repositories\UserRepository
     */
    protected $jobs;

    public function __construct(
        JobsRepository $jobs)
    {
        parent::__construct();
        $this->jobs = $jobs;

        if (! user('object')->can('type_in')) {
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
        ];
        $items = $this->jobs->index($data, 'manager', Cache::get('page_size', '10'));
        $serverUrl = 'http://112.74.86.237:8080/img/';
        return view('back.jobs.index', compact('items','serverUrl'));

    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
        // $roles = $this->person->role();
        return view('back.jobs.create');
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
        var_dump('store');die;
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
        return view('back.jobs.edit', compact('user', 'roles', 'own_role'));
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
        var_dump('update');die;
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
}
