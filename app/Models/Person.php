<?php

namespace Douyasi\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Zizaco\Entrust\Traits\EntrustUserTrait;

/**
 * 用户模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Person extends Model implements AuthenticatableContract, CanResetPasswordContract
{
    
    use Authenticatable, CanResetPassword;
    use EntrustUserTrait;
    
    protected $connection = 'mysql_front_tables';
    protected $table = 'persons';
    

    #********
    #* 此表为复合型的用户数据表，根据type不同确定不同用户
    #* type : Manager 管理型用户
    #* type : Customer 投资型客户
    #********
    //限定管理型用户
    public function scopeManager($query)
    {
        // return $query->where('user_type', '=', 'manager');
    }

    //限定投资型客户
    public function scopeCustomer($query)
    {
        // return $query->where('user_type', '=', 'customer');
    }
    public function works()
    {
        //模型名 外键 本键
        return $this->hasMany('Douyasi\Models\Works', 'uid', 'uid');
    }
}
