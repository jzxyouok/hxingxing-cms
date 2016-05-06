<?php

namespace Douyasi\Models;

use Eloquent;

/**
 * 内容模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Opera extends Eloquent
{
    protected $connection = 'mysql_front_tables';
    protected $table = 'operas';
    /**
     * 分类
     * 模型对象关系：内容对应的分类[仅文章存在分类]
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */

    public function contact()
    {
        //模型名 外键 本键
        return $this->hasOne('Douyasi\Models\Person', 'uid', 'uid');
    }
    public function pubOpera($ids)
    {   
        return $this->whereIn('id', $ids)->update(array('pubStatus' => 1));
    }
    public function jobs()
    {
        //模型名 外键 本键
        return $this->hasMany('Douyasi\Models\Jobs', 'operaId', 'id');
    }
}
