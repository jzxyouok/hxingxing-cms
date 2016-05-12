<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Jobs;
use Douyasi\Models\Role;

/**
 * 用户仓库UserRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class JobsRepository extends BaseRepository
{
    /**
     * The Role instance.
     *
     * @var Douyasi\Models\Role
     */
    protected $role;

    /**
     * Create a new PersonRepository instance.
     *
     * @param  Douyasi\Models\Content $content
     * @param  Douyasi\Models\Role $role
     * @return void
     */
    public function __construct(
        Jobs $jobs,
        Role $role)
    {
        $this->model = $jobs;
        $this->role = $role;
    }

    /**
     * 存储管理型用户
     *
     * @param  Douyasi\Models\User $manager
     * @param  array $inputs
     * @return Douyasi\Models\User
     */
    private function saveManager($manager, $inputs)
    {
        unset($inputs['_url'],$inputs['id']);
        foreach ($inputs as $key => $value) {
            $manager->$key = e($value);
        }

        $manager->save();

        return $manager;
    }


    /**
     * 更新管理型用户
     *
     * @param  Douyasi\Models\User $manager
     * @param  array $inputs
     * @return void
     */
    private function updateManager($manager, $inputs)
    {
        //$manager->uid = e($inputs['uid']);
        //$manager->operaId = e($inputs['operaId']);
        unset($inputs['_url']);
        foreach ($inputs as $key => $value) {
            $manager->$key = e($value);
            # code...
        }

        $manager->save();
        return $manager;
    }

    /**
     * 获取所有角色(用户组)
     *
     * @return Illuminate\Support\Collection
     */
    public function role()
    {
        return $roles = $this->role->all();
    }

    /**
     * 获取用户角色
     *
     * @param  Douyasi\Models\User
     * @return Illuminate\Support\Collection
     */
    public function getRole($manager)
    {
        return $manager->roles->first();
    }

    /**
     * 伪造一个id为0的Role对象
     *
     * @return Douyasi\Models\Role
     */
    public function fakeRole()
    {
        $role = new $this->role;
        $role->id = 0;  //id置为不存在的0
        return $role;
    }

    /**
     * 获取特定id管理员信息
     * 
     * @param  int $id
     * @return Douyasi\Models\User
     */
    public function manager($id)
    {
        return $this->model->manager()->find($id);
    }

    #********
    #* 资源 REST 相关的接口函数 START
    #********
    /**
     * 用户资源列表数据
     *
     * @param  string $type 用户模型类型 管理型用户manager,客户customer
     * @param  array $data 额外传入的参数
     * @param  string $size 分页大小
     * @param  boolean $show_all 是否显示所有客户（不限定专属客服）
     * @return Illuminate\Support\Collection
     */
    public function index( $data = [], $type = 'manager', $size = '10', $show_all = false)
    {
        if (!ctype_digit($size)) {
            $size = '10';
        }
        
        $users = $this->model->customer()->with('opera')
                            ->where('name', 'like', '%'.e($data['name']).'%')
                            ->orderBy('uid', 'desc')
                             //->get()->toArray();
                            ->paginate($size);
                            // var_dump($users);die();
        return $users;
    }

    /**
     * 存储用户
     *
     * @param  array $inputs
     * @param  string $type 用户模型类型 管理型用户manager,客户customer
     * @param  string|int $user_id 管理用户id
     * @return Douyasi\Models\User
     */
    public function store($inputs, $type = 'manager', $user_id = '0')
    {
        $user = new $this->model;
        if ($type === 'manager') {
            $user = $this->saveManager($user, $inputs);
        }
        return $user;
    }


    /**
     * 获取编辑的用户
     *
     * @param  int $id
     * @param  string $type 用户模型类型 管理型用户manager,客户customer
     * @return Illuminate\Support\Collection
     */
    public function edit($id, $type = 'manager')
    {
        if ($type === 'manager') {
            $user = $this->model->manager()->findOrFail($id);
        }
        return $user;
    }

    /**
     * 更新用户
     *
     * @param  int $id
     * @param  array $inputs
     * @param  string 用户模型类型 管理型用户manager,客户customer
     * @return void
     */
    public function update($id, $inputs, $type = 'manager')
    {
        if ($type === 'manager') {
            $user = $this->model->manager()->findOrFail($id);
            $user = $this->updateManager($user, $inputs);
        }
    }
    public function countJobs($operaId){
        return  $this->model->where('operaId',$operaId)->count();
    }
    public function destroy($ids, $type = 'article') {
        // $in = [];
        // if ($ids!='') {
        //     $in = explode(',', $ids);
        // }
        // var_dump($in);die();
        $content = $this->model->findOrFail($ids);
        $content->delete();
    }
    public function pubJobs($ids) {
        $this->model->pubJobs($ids);
    }
}
