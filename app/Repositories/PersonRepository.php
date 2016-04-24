<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Person;
use Douyasi\Models\Role;
use Douyasi\Models\Works;
/**
 * 用户仓库UserRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class PersonRepository extends BaseRepository
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
        Person $person,
        Role $role,
        Works $work
    )
    {
        $this->model = $person;
        $this->role = $role;
        $this->work = $work;
    }

    /**
     * 存储管理型用户
     *
     * @param  Douyasi\Models\User $manager
     * @param  array $inputs
     * @return Douyasi\Models\User
     */
    private function saveManager($person, $inputs)
    {
        $person->name = e($inputs['name']);
        $person->fakeMobile = e($inputs['fakeMobile']);
        $person->mobile = e($inputs['mobile']);
        $person->company = e($inputs['company']);
        $person->position = e($inputs['position']);

        $person->save();
        return $person;
    }


    /**
     * 更新管理型用户
     *
     * @param  Douyasi\Models\User $manager
     * @param  array $inputs
     * @return void
     */
    private function updateManager($person, $inputs)
    {
        $this->model->where('uid', $person->uid)->update((array)$person);
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
        
        $users = $this->model->customer()->with('works')
                            ->where('name', 'like', '%'.e($data['name']).'%')
                            ->where('mobile', 'like', '%'.e($data['mobile']).'%')
                            ->orderBy('uid', 'desc')
                            // ->get()->toArray();
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
        unset($inputs['_url']);
        unset($inputs['uid']);
        $this->model->where('uid', $id)->update((array)$inputs);
    }
    public function checkMobile($mobile,$uid)
    {
        $query = $this->model->where('mobile', $mobile);
        if ($uid>0) {
            $query->where('uid', '!=', $uid);
        }
        return $query->value('uid');
    }
    public function delWork($workId)
    {
        $this->work->delWork($workId);
    }
    #********
    #* 资源 REST 相关的接口函数 END
    #********
}
