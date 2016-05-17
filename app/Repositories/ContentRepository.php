<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Content;
use Douyasi\Models\Meta;

/**
 * 内容仓库ContentRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class ContentRepository extends BaseRepository {

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
		Content $content,
		Meta $meta) {
		$this->model = $content;
		$this->meta = $meta;
	}

	/**
	 * 获取内容模型所有类型
	 *
	 * @return array
	 */
	private function getModelTypes() {
		return [
			'article', //文章
			'page', //单页
			'fragment', //碎片
		];
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
	private function saveContent($content, $inputs, $type = 'article', $user_id = '0') {
		$fields = ['title','author','content','thumb','is_draft','category_id','is_top','outer_link','slug'];
		foreach ($fields as $key => $value) {
			if (array_key_exists($value, $inputs)) {
				$content->$value = e($inputs[$value]);
			}
		}

		$content->type = 'article';
		$content->flag = '';
		if ($user_id) {
			$content->user_id = $user_id;
		}

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
	 * @param  string $is_draft 1-草稿 0-已发布
	 * @param  string $size 分页大小
	 * @return Illuminate\Support\Collection
	 */
	public function index($data = [], $is_draft = 1, $category = array('1', '2'), $size = '10') {
		if (!ctype_digit($size)) {
			$size = '10';
		}
		// if ($type === 'page') {
		//     $data = array_add($data, 's_title', '');
		//     $ret = $this->model->page()
		//                         ->where('title', 'like', '%'.e($data['s_title']).'%')
		//                         ->orderBy('is_top', 'desc')
		//                         ->orderBy('id', 'desc')
		//                         ->paginate($size);
		// } elseif ($type === 'fragment') {
		//     $data = array_add($data, 's_title', '');
		//     $data = array_add($data, 's_slug', '');
		//     $ret = $this->model->fragment()
		//                         ->where('title', 'like', '%'.e($data['s_title']).'%')
		//                         ->where('slug', 'like', '%'.e($data['s_slug']).'%')
		//                         ->paginate($size);
		// } else {
		$data = array_add($data, 's_title', '');
		$data = array_add($data, 'is_draft', $is_draft);
		$ret = $this->model->article()->with(array(
			'newsComment' => function ($query) {
				$query->orderBy('id', 'desc');
			},
		))->where('title', 'like', '%' . e($data['s_title']) . '%')
			->where('is_draft', '=', $is_draft)
			->orderBy('is_top', 'desc')
			->orderBy('id', 'desc')
			->with(array('meta' => function ($query) {
				$query->where('type', '=', 'CATEGORY');
			})) //->get()->toArray();
			->paginate($size);
		//var_dump($ret);die;
		// }
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
	public function store($inputs, $type = 'article', $user_id = '0') {
		$content = new $this->model;
		$types = $this->getModelTypes();
		if (in_array($type, $types)) {
			$content = $this->saveContent($content, $inputs, $type, $user_id);
		}
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
		if ($type === 'page') {
			$content = $this->model->page()->findOrFail($id);
			$content = $this->saveContent($content, $inputs, 'page');
		} elseif ($type === 'fragment') {
			$content = $this->model->fragment()->findOrFail($id);
			$content = $this->saveContent($content, $inputs, 'fragment');
		} else {
			$content = $this->model->article()->findOrFail($id);
			$content = $this->saveContent($content, $inputs, 'article');
		}
	}

	/**
	 * 删除内容
	 *
	 * @param  int $id
	 * @param  string $type 内容模型类型 文章article,单页page,碎片fragment
	 * @return void
	 */
	public function destroy($id, $type = 'article') {
		if ($type === 'page') {
			$content = $this->model->page()->findOrFail($id);
		} elseif ($type === 'fragment') {
			$content = $this->model->fragment()->findOrFail($id);
		} else {
			$content = $this->model->article()->findOrFail($id);
		}
		$content->delete();
		// $this->model->getCommentByNewsId($id);
	}
	public function updViewNum($id, $num, $is_show) {
		$this->model->updViewNum($id, $num, $is_show);
	}
	public function delComment($id, $newsId) {
		$this->model->delComment($id, $newsId);
	}
	#********
	#* 资源 REST 相关的接口函数 END
	#********
}
