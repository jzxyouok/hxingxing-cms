<?php

namespace Douyasi\Http\Controllers\Admin;

use Cache; //请求层
use Douyasi\Cache\DataCache;
use Douyasi\Extensions\ChuanglanSmsApi;
use Douyasi\Extensions\Easemob; //模型仓库层
use Douyasi\Http\Controllers\Controller; //推荐位仓库层
use Douyasi\Http\Requests\OperaRequest;
use Douyasi\Repositories\FlagRepository;
use Douyasi\Repositories\OperaRepository;
use Illuminate\Http\Request;

/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminOperaController extends BackController {

	/**
	 * The ContentRepository instance.
	 *
	 * @var Douyasi\Repositories\ContentRepository
	 */
	protected $content;

	/**
	 * The FlagRepository instance.
	 *
	 * @var Douyasi\Repositories\FlagRepository
	 */
	protected $flag;

	/**
	 * 推荐位缓存数据
	 *
	 * @var array
	 */
	protected $flags;

	public function __construct(
		OperaRepository $content,
		FlagRepository $flag) {
		parent::__construct();
		$this->content = $content;
		$this->flag = $flag;
		if (!user('object')->can('type_in') && !user('object')->can('customer_service')) {
			$this->middleware('deny403');
		}
		if (!Cache::has('flags')) {
			//如果推荐位缓存不存在
			DataCache::cacheFlags();
		}
		$this->flags = Cache::get('flags');
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request) {
		$manageRole = false;
		if (user('object')->can('customer_service')) {
			$manageRole = true;
		}
		$serverUrl = 'http://112.74.86.237:8080/img/';
		return view('back.opera.index', compact('typeRole', 'manageRole', 'serverUrl'));
	}

	public function tagsData(Request $request) {
		$tags = $this->content->tags();
		$returnTags = [];
		foreach ($tags as $k => $val) {
			$category = [];
			$idArr = explode(',', $val['ids']);
			$labelArr = explode(',', $val['labels']);
			foreach ($idArr as $k_c => $val_c) {
				$label = isset($labelArr[$k_c]) ? $labelArr[$k_c] : '';
				array_push($category, ['id' => $val_c, 'name' => $labelArr[$k_c]]);
			}
			$returnTags[$val['category']] = $category;
		}
		echo json_encode($returnTags, JSON_NUMERIC_CHECK);
	}

	public function indexData(Request $request, $pubStatus) {
		$data = [];
		$searchFields = array( /*'id',*/'name', 'invest', 'categoryC', 'topicC1', 'topicC2', 'topicC3', 'siteC', 'startTimeC', 'periodC', 'runTime', 'outline');
		foreach ($searchFields as $k => $val) {
			$data[$val] = $request->input($val);
		}
		$data['pubStatus'] = $pubStatus;
		$onlySelf = false;
		if (!user('object')->can('customer_service')) {
			$onlySelf = true;
		}
		$operas = $this->content->index($data, $onlySelf, Cache::get('page_size', '10'));

		// escape special char
		foreach ($operas as $k => $val) {
			$operas[$k]['contact']['name'] = str_replace(" ", "&nbsp;", htmlentities($val['contact']['name']));
            $operas[$k]['contact']['company'] = str_replace(" ", "&nbsp;", htmlentities($val['contact']['company']));
            $operas[$k]['contact']['remark'] = str_replace(" ", "&nbsp;", htmlentities($val['contact']['remark']));
			foreach ($val['jobs'] as $kJ => $valJ) {
				$operas[$k]['jobs'][$kJ]['role'] = str_replace(" ", "&nbsp;", htmlentities($valJ['role']));
				$operas[$k]['jobs'][$kJ]['descrip'] = str_replace(" ", "&nbsp;", htmlentities($valJ['descrip']));
				$operas[$k]['jobs'][$kJ]['roleDescrip'] = str_replace(" ", "&nbsp;", htmlentities($valJ['roleDescrip']));
			}
		}
		// var_dump($operas);die();
		echo json_encode($operas, JSON_UNESCAPED_UNICODE);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create() {
		//需传递分类信息进去
		// $categories = $this->content->meta();
		// $flags = $this->flag->index();
		// return view('back.opera.create', compact('categories', 'flags'));
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(OperaRequest $request) {
		$data = $request->all(); //获取请求过来的数据
		// var_dump($data);
		//var_dump('store');die();
		$content = $this->content->store($data, user('id')); //使用仓库方法存储
		if ($content->id) {
			//添加成功
			echo json_encode($content, JSON_NUMERIC_CHECK);
		} else {
			//添加失败
			return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
		}
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id) {
		//
		$categories = $this->content->meta();
		$article = $this->content->edit($id, 'article');
		//已经findOrFail处理，如果不存在该id资源会抛出异常，再加is_null判定无意义
		//is_null($article) and abort(404);
		$flags = $this->flag->index();
		return view('back.opera.edit', ['data' => $article, 'categories' => $categories, 'flags' => $flags]);
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param \Douyasi\Http\Requests\OperaRequest $request
	 * @param  int  $id
	 * @return Response
	 */
	public function update(OperaRequest $request, $id) {
		//
		$data = $request->all();
		//var_dump('update');die;
		return $this->content->update($id, $data, 'article');
		// return redirect()->route('admin.article.index')->with('message', '修改文章成功！');
	}
	public function pubOpera(Request $request, $ids) {
		$ids = explode(',', $ids);
		$this->content->pubOpera($ids);
		echo 1;
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($ids) {
		if (!user('object')->can('customer_service')) {
			die('权限不足！');
		}
		$this->content->destroy($ids, 'article');
		echo 1;
		// return redirect()->route('admin.opera.index')->with('message', '删除剧目成功！');
	}

	private function newEasemob() {
		$options['client_id'] = 'YXA6GE-eINUnEeWsSV3hfNAN8Q';
		$options['client_secret'] = 'YXA60AK_25-5gNGQ1D_rUzjZrqnaYsI';
		$options['org_name'] = 'shiheng2015';
		$options['app_name'] = 'hongka';
		return new Easemob($options);
	}
	public function getHxUsers(OperaRequest $request) {
		$h = $this->newEasemob();
		$aaa = $h->getUsers();

		if ($aaa) {
			$users = $aaa['entities'];
			var_dump($users);die();
		}
	}

	public function hxPush($mobile, $content = '', $uid) {
		// var_dump($data);die();
		$h = $this->newEasemob();

		$simpleCard = ['uname' => '红猩猩', 'msgType' => 'likeMe', 'time' => time(), 'unread' => true, 'avatar' => 'http://112.74.86.237:8081/logo.ico'];
		// $uids = ['73y'];
		$uids[] = $uid . 'y';
		$uids[] = $uid . 'z';
		$result = $h->sendText('admin', 'users', $uids, $content, ['data' => (object) $simpleCard]);

		$return = [];
		$ql = 'select+*+where+timestamp>1435536480000+from="admin"+and+to="' . $uid . 'y"+or+to="' . $uid . 'z"+limit=10+cursor=**';
		// $cursor=$h->readCursor("chatfile.txt");
		$history = $h->getChatRecord($ql);
		// var_dump($history);
		foreach ($history['entities'] as $k => $val) {
			$return[date('m-d H:i', round($val['timestamp'] / 1000))] = $val['payload']['bodies'][0]['msg'];
		}
		// var_dump($return);die();
		return $result['data'][$uid . 'y'] == 'success' && $result['data'][$uid . 'z'] == 'success' ? json_encode($return, JSON_UNESCAPED_UNICODE) : 0;
	}
	public function hxChatHistory($uid, $page) {
		// var_dump($data);die();
		$h = $this->newEasemob();

		$return = [];
		$ql = 'select+*+where+timestamp>1435536480000+from="admin"+and+to="' . $uid . 'y"+or+to="' . $uid . 'z"+limit=10+cursor=**';
		// $cursor=$h->readCursor("chatfile.txt");
		$history = $h->getChatRecord($ql);
		// var_dump($history);
		foreach ($history['entities'] as $k => $val) {
			$return[date('m-d H:i', round($val['timestamp'] / 1000))] = $val['payload']['bodies'][0]['msg'];
		}
		return $return;
	}
	private function newChuanglan() {
		$config = [
			'api_send_url' => 'http://222.73.117.156/msg/HttpBatchSendSM',
			'api_balance_query_url' => 'http://222.73.117.156/msg/QueryBalance',
			'api_account' => 'shiheng',
			'api_password' => 'Sh888123',
		];
		return new ChuanglanSmsApi($config);
	}
	public function smsPush($mobile, $content = '', $uid) {
		$clapi = $this->newChuanglan();
		// $mobile = '15711553913';
		// $content = '【红色咖啡】大人，周星驰发布了女主（求职意向岗位）微简历，他（她）是你的艺中人吗？';

		$result = $clapi->sendSMS($mobile, $content, 'true');
		$result = $clapi->execResult($result);
		// var_dump($result);
		return $result['1'] == 0 ? 1 : 0;
	}
	public function pushMsg(OperaRequest $request) {
		$data = $request->all();
		$function = $data['pushType'] . 'Push';
		// var_dump($function);die();
		echo $this->$function($data['mobile'], $data['content'], $data['uid']);
	}
	public function checkOpera(OperaRequest $request) {
		$name = $request->input('name');
		$id = $request->input('id');
		$exsit = $this->content->checkOpera($name, $id);
		echo $exsit ? false : true;
	}
}
