<?php

namespace Douyasi\Repositories;

use DB;
use Douyasi\Models\Meta;
use Douyasi\Models\Opera;
use Douyasi\Models\Person;
use Douyasi\Models\Tags;

/**
 * 内容仓库ContentRepository
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class OperaRepository extends BaseRepository {

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
		Opera $content,
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
	private function saveContent($content, $inputs, $user_id = '0') {
		$allFields = array('name', 'invest', 'categoryC', 'category', 'topicC1', 'topic1', 'topicC2', 'topic2', 'topicC3', 'topic3', 'siteC', 'site', 'startTimeC', 'startTime', 'periodC', 'period', 'runTime', 'outline', 'producer', 'creator', 'platform', 'pubStatus', 'uid','cover');
		foreach ($allFields as $k => $val) {
			if (array_key_exists($val, $inputs)) {
				$content->$val = e($inputs[$val]);
			}
		}
		
		// set created_uid for a new data
		if (!isset($content->created_uid)) {
			$content->created_uid = user('id');
		}
		/*if ($user_id) {
			            $content->uid = $user_id;
		*/
		//var_dump($content);die();
		$content->save();
		$content = $this->model->with('contact')->findOrFail($content->id);
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
		//var_dump($data);//die();
		$query = $this->model->with(array(
			'contact' => function ($query) {
				$query->get(['uid', 'isPubed', 'name', 'realMobile', 'fakeName', 'fakeMobile', 'company', 'position', 'otherName', 'otherMobile', 'otherCompany', 'remark']);
			}, 'jobs' => function ($query) {
				$query->get(['id', 'operaId', 'name', 'salary', 'descrip', 'role', 'age', 'nameC', 'descrip', 'role', 'styleC1', 'style1', 'styleC2', 'style2', 'styleC3', 'style3', 'height', 'age', 'weight', 'salaryC', 'salaryUnitC', 'roleDescrip']);
			}));
		if ($onlySelf) {
			$query->where('created_uid', user('id'));
		}
		$searchFields = array('name', 'invest', 'categoryC', 'topicC1', 'topicC2', 'topicC3', 'siteC', 'startTimeC', 'periodC', 'runTime', 'outline');
		foreach ($searchFields as $k => $val) {
			if (!is_numeric($data[$val]) && trim($data[$val]) != '' || is_numeric($data[$val]) && $data[$val] > 0) {
				$query->where($val, 'like', '%' . e($data[$val]) . '%');
			}
		}
		return $query->where('pubStatus', e($data['pubStatus'])) /*->where('operas.id',e($data['id']))*/->orderBy('id', 'desc')->get()->toArray();
	}

	/**
     * for updating data
     */
	public function allOperaIds() {
		return $this->model->orderBy('id','desc')->lists('id')->toArray();
	}
	public function getPubTime() {
		return $this->model->orderBy('id','desc')->select('id','pubTime')->get()->toArray();
	}
	public function tags($data = []) {

		$ret = Tags::select('category', DB::raw('GROUP_CONCAT(code) as ids,GROUP_CONCAT(name) AS labels'))
			->groupBy('category')
			->get()->toArray();
		// $ret = Tags::groupBy('category')->get();
		//var_dump($ret);die();
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
	public function store($inputs, $user_id = '0') {
		$content = new $this->model;
		return $this->saveContent($content, $inputs, $user_id);
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
		$content = $this->model->findOrFail($id);
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
	public function pubOpera($ids) {
		$this->model->pubOpera($ids);
	}
	public function updateJobsNum($id,$action,$jobsNum=0) {
		if ($action=='add') {
			$this->model->increment('jobsNum', 1, ['id' => $id]);
		}elseif($action=='delete'){
			$this->model->decrement('jobsNum', 1, ['id' => $id]);
		}elseif($action=='update'){
			$this->model->where('id', $id)->update(['jobsNum' => $jobsNum]);
		}
	}
	public function checkOpera($name, $id) {
        //var_dump($name,$id);die;
		$query = $this->model->where('name', $name)->where('created_uid', '>', 0);
		if ($id > 0) {
			$query->where('id', '!=', $id);
		}
		return $query->value('id');
	}
	#********
	#* 资源 REST 相关的接口函数 END
	#********
}
