<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Person;
use Douyasi\Models\Meta;
use Douyasi\Models\Tags;
use DB;
/**
 * 内容仓库ContentRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class PushMsgRepository extends BaseRepository
{

    /**
     * The Meta instance.
     *
     * @var Douyasi\Models\Meta
     */
    protected $meta;

    /**
     * Create a new ContentRepository instance.
     *
     * @param  Douyasi\Models\Content $content
     * @param  Douyasi\Models\Meta $meta
     * @return void
     */
    public function __construct(
        Person $content,
        Meta $meta,
        Person $person)
    {
        $this->model = $content;
        $this->meta = $meta;
        $this->person = $person;
    }

    /**
     * 获取所有Meta元数据
     *
     * @param  string $type 元模型类型 分类category,标签tag
     * @return Illuminate\Support\Collection
     */
    public function meta($type = 'category')
    {
        if ($type === 'tag') {
            $metas = $this->meta->tag()->get();
        } else {
            $metas = $this->meta->category()->get();
        }
        return $metas;
    }
    public function persons()
    {
        return $this->person->get();
    }

    /**
     * 获取特定slug碎片
     *
     * @param  string $slug 碎片slug
     * @return Illuminate\Support\Collection
     */
    public function fragment($slug)
    {
        return $this->model->where('slug', '=', e($slug))->fragment()->first();
    }

    /**
     * 创建或更新内容
     *
     * @param  Douyasi\Models\Content $content
     * @param  array $inputs
     * @param  string $type
     * @param  string|int $user_id
     * @return Douyasi\Models\Content
     */
    private function saveContent($content, $inputs, $user_id = '0')
    {
        // var_dump($content->attributes);die();
        $content->name   = e($inputs['name']);
        // $content->content = e($inputs['content']);
        // $content->thumb   = e($inputs['thumb']);
            // $content->category_id = e($inputs['category_id']);
            // $content->type        = 'article';
            $tmp_flag = '';
            /*这里需要对推荐位flag进行处理*/
            if(!empty($inputs['flag']) && is_array($inputs['flag'])) {
                foreach($inputs['flag'] as $flag)
                {
                    if(!empty($flag)){
                        $tmp_flag .= $flag.',';
                    }
                }
                $content->flag = $tmp_flag;
            }
        if (array_key_exists('pubStatus', $inputs)) {
            $content->pubStatus = e($inputs['pubStatus']) ;
        }
        if ($user_id) {
            $content->uid = $user_id;
        }
// var_dump($content);die();
        $content->save();

        return $content;
    }


    #********
    #* 资源 REST 相关的接口函数 START
    #********
    /**
     * 内容资源列表数据
     *
     * @param  array $data
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @param  string $size 分页大小
     * @return Illuminate\Support\Collection
     */
    public function index($data = [],$type = 'article',  $size = '50')
    {
        if (!ctype_digit($size)) {
            $size = '50';
        }
        // var_dump($data);die();
        $searchFields = array('name','invest','category','topic1','site','startTime','period','runTime');
        foreach ($searchFields as $k => $val) {
            $data = array_add($data, $val, '');
        }
        // var_dump($data);die();
        $ret = $this->model->with('contact')
            // ->select('name', 'invest', 'category')
            ->where('name', 'like', '%'.e($data['name']).'%')
            ->where('invest', 'like', '%'.e($data['invest']).'%')
            // ->where('category', 'like', '%'.e($data['category']).'%')
            ->where('topic1', 'like', '%'.e($data['topic1']).'%')
            ->where('site', 'like', '%'.e($data['site']).'%')
            ->where('startTime', 'like', '%'.e($data['startTime']).'%')
            ->where('period', 'like', '%'.e($data['period']).'%')
            ->where('runTime', 'like', '%'.e($data['runTime']).'%')
            ->orderBy('id', 'desc')
            ->get()->toArray();
            // ->paginate(100);
        // var_dump($ret);die();
        return $ret;
    }
    public function tags($data = []){
        $ret = Tags::select('category', DB::raw('GROUP_CONCAT(id) as ids,GROUP_CONCAT(label) AS labels'))
        ->groupBy('category')->whereIn('category', ['jobCategory','jobTopic','startTime','shootPeriod'])
           ->get()->toArray();
        // $ret = Tags::groupBy('category')->get();
        // var_dump($ret);die();
        return $ret;
    }
    /**
     * 存储内容
     *
     * @param  array $inputs
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @param  string|int $user_id 管理用户id
     * @return Douyasi\Models\Content
     */
    public function store($inputs, $user_id = '0')
    {
        $content = new $this->model;
            $content = $this->saveContent($content, $inputs, $user_id);
        return $content;
    }

    /**
     * 获取编辑的内容
     *
     * @param  int $id
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @return Illuminate\Support\Collection
     */
    public function edit($id, $type = 'article')
    {
        if ($type === 'page') {
            $content = $this->model->page()->findOrFail($id);
        } elseif ($type === 'fragment') {
            $content = $this->model->fragment()->findOrFail($id);
        } else {
            $content = $this->model->article()->findOrFail($id);
        }
        return $content;
    }

    /**
     * 更新内容
     *
     * @param  int $id
     * @param  array $inputs
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @return void
     */
    public function update($id, $inputs, $type = 'article')
    {
        $content = $this->model->findOrFail($id);
        $content = $this->saveContent($content, $inputs);
    }

    /**
     * 删除内容
     *
     * @param  int $id
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @return void
     */
    public function destroy($ids, $type = 'article')
    {
        // $in = [];
        // if ($ids!='') {
        //     $in = explode(',', $ids);
        // }
        // var_dump($in);die();
        $content = $this->model->findOrFail($ids);
        $content->delete();
    }
    #********
    #* 资源 REST 相关的接口函数 END
    #********
}
