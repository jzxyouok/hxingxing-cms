<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Meta;
use Douyasi\Models\HotWords;
use Douyasi\Models\Person;
use DB;
/**
 * 内容仓库ContentRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class HotWordsRepository extends BaseRepository {

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
        HotWords $content,
        Meta $meta,
        Person $person
    ) {
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
    public function meta($type = 'category') {
        if ($type === 'tag') {
            $metas = $this->meta->tag()->get();
        } else {
            $metas = $this->meta->category()->get();
        }
        return $metas;
    }

    /**
     * 获取特定slug碎片
     *
     * @param  string $slug 碎片slug
     * @return Illuminate\Support\Collection
     */
    public function fragment($slug) {
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
    private function saveContent($content, $inputs) {
        $content->word = e($inputs['word']);
        $content->type = e($inputs['type']);
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
     * @param  string $onlySelf  权限控制，只能看到自己的剧目
     * @param  string $size 分页大小
     * @return Illuminate\Support\Collection
     */
    public function index($data = [], $onlySelf = true, $size = '50') {
        if (!ctype_digit($size)) {
            $size = '50';
        }

        //return $this->model->where('type','like', '%persons%')->orderBy('id', 'desc')->get()->toArray();
        $query = $this->model;
        $searchFields = array('word', 'type');
        foreach ($searchFields as $k => $val) {
            if (trim($data[$val]) != '') {
                $query->where($val, 'like', '%' . e($data[$val]) . '%');
            }
        }
        return $query->orderBy('id', 'desc')->get()->toArray();

    }
    /**
     * 存储内容
     *
     * @param  array $inputs
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @param  string|int $user_id 管理用户id
     * @return Douyasi\Models\Content
     */
    public function store($inputs, $user_id = '0') {
        $content = new $this->model;
        $content = $this->saveContent($content, $inputs);
        return $content;
    }

    /**
     * 获取编辑的内容
     *
     * @param  int $id
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @return Illuminate\Support\Collection
     */
    public function edit($id, $type = 'article') {
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
    public function update($id, $inputs, $type = 'article') {
        $content = $this->model->findOrFail($id); //查表
        return $this->saveContent($content, $inputs);
    }

    /**
     * 删除内容
     *
     * @param  int $id
     * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
     * @return void
     */
    public function destroy($ids, $type = 'article') {
        // $in = [];
        // if ($ids!='') {
        //     $in = explode(',', $ids);
        // }
        // var_dump($in);die();
        $content = $this->model->findOrFail($ids);
        $content->delete();
    }
}
