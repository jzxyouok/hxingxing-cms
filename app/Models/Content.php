<?php

namespace Douyasi\Models;

use Eloquent;
use Douyasi\Models\newsComment;
/**
 * 内容模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Content extends Eloquent
{
    protected $table = 'contents';

    #********
    #* 此表为复合型的内容数据表，根据type不同确定不同内容模型
    #* type : article 文章模型
    #* type : page 单页模型
    #* type : fragment 碎片模型
    #* type : memo 备忘模型
    #********
    //限定文章
    public function scopeArticle($query)
    {
        return $query->where('type', '=', 'article');
    }

    //限定单页
    public function scopePage($query)
    {
        return $query->where('type', '=', 'page');
    }

    //限定碎片
    public function scopeFragment($query)
    {
        return $query->where('type', '=', 'fragment');
    }

    //限定备忘
    public function scopeMemo($query)
    {
        return $query->where('type', '=', 'memo');
    }

    /**
     * 分类
     * 模型对象关系：内容对应的分类[仅文章存在分类]
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function meta()
    {
        //模型名 外键 本键
        return $this->hasOne('Douyasi\Models\Meta', 'id', 'category_id');
    }
    public function user()
    {
        //模型名 外键 本键
        return $this->hasOne('Douyasi\Models\User', 'id', 'user_id');
    }
    public function newsComment()
    {
        //模型名 外键 本键
        return $this->hasMany('Douyasi\Models\newsComment', 'newsId', 'id');
    }
    public function updViewNum($id,$num,$is_show)
    {
        return $this->where('id', $id)->update(['viewNum' => $num,'is_show_viewNum'=>$is_show]);
    }
    public function delComment($id,$newsId)
    {
        $this->whereId($newsId)->decrement('commentNum');
        return newsComment::where('id', $id)->delete();
    }
    public function delCommentByNewsId($id)
    {
        return newsComment::where('NewsId', $id)->delete();
    }
}
