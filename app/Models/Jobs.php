<?php

namespace Douyasi\Models;

use Eloquent;

/**
 * 用户模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Jobs extends Eloquent
{
    
    protected $connection = 'mysql_front_tables';
    protected $table = 'jobs';
    

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
    public function opera()
    {
        //模型名 外键 本键
        return $this->belongsTo('Douyasi\Models\Opera', 'operaId', 'id');
    }
    public function pubJobs($ids) {
        return $this->whereIn('operaId', $ids)->update(array('updTime' => round(microtime(true) * 1000)));
    }

}
