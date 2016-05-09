<?php

namespace Douyasi\Http\Controllers\Admin;

use Cache;
use Douyasi\Http\Requests\PersonRequest;
use Douyasi\Logger\SystemLogger as SystemLogger;
use Douyasi\Repositories\JobsWantRepository;
use Douyasi\Repositories\OperaRepository;
use Douyasi\Repositories\PersonRepository;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;

/**
 * （管理型）用户资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminPersonController extends BackController {
	/**
	 * The UserRepository instance.
	 *
	 * @var Douyasi\Repositories\UserRepository
	 */
	protected $person;

	public function __construct(PersonRepository $person, OperaRepository $opera, JobsWantRepository $jobWant, Route $route) {
		parent::__construct();
		$this->person = $person;
		$this->opera = $opera;
		$this->jobWant = $jobWant;
		$actionName = $route->getActionName();
		list($class, $method) = explode('@', $actionName);
		if (in_array($method, ['index', 'delWork']) && !user('object')->can('manage_users')) {
			$this->middleware('deny403');
		}
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index(Request $request) {
		//
		$data = [
			'name' => $request->input('s_name'),
			'mobile' => $request->input('s_phone'),
		];
		$tab = isset($_GET['tab']) ? (is_numeric($_GET['tab']) ? $_GET['tab'] : 0) : 0;
		$unpub = $this->person->index($data, 0, Cache::get('page_size', '10'));
		$pubed = $this->person->index($data, 1, Cache::get('page_size', '10'));
		// var_dump($persons);die;
		$serverUrl = 'http://112.74.86.237:8080/img/';
		$canDel = true;
		if (!user('object')->can('manage_users') || !user('object')->can('manage_system')) {
			$canDel = false;
		}
		return view('back.person.index', compact('unpub', 'pubed', 'serverUrl', 'canDel', 'tab'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create() {
		//
		$roles = $this->person->role();
		return view('back.person.create', ['roles' => $roles]);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(PersonRequest $request) {
		//
		$data = $request->all();
		// var_dump($data);
		// var_dump('store');die;
		$manager = $this->person->store($data, 'manager');
		if ($manager->id) {
			//添加成功
			//记录系统日志，这里并未使用事件监听来记录日志
			$log = [
				'uid' => user('id'),
				'type' => 'manager',
				'content' => '管理员：成功新增一名管理用户' . $manager->username . '<' . $manager->email . '>。',
			];
			SystemLogger::write($log);

			// return redirect()->route('admin.person.index')->with('message', '成功新增管理员！');
			if (isset($data['operaId']) && $data['operaId'] > 0) {
				$this->opera->update($data['operaId'], array('uid' => $manager->id), 'manager');
			}
			if (isset($data['jobWantId']) && $data['jobWantId'] > 0) {
				$this->jobWant->update($data['jobWantId'], array('uid' => $manager->id));
			}
			echo $manager->id;
		} else {
			echo 1;
			// return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
		}
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id) {
		return view('back.person.edit', compact('user', 'roles', 'own_role'));
	}
	public function checkMobile(PersonRequest $request) {
		$mobile = $request->input('mobile');
		$uid = $request->input('uid');
		$exsit = $this->person->checkMobile($mobile, $uid);
		echo $exsit ? 'false' : 'true';
	}
	public function searchMobile(PersonRequest $request) {
		$mobile = $request->input('mobile');
		$res = $this->person->searchMobile($mobile);
		return $res ? $res : false;
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update(PersonRequest $request, $id) {
		//
		$data = $request->all();
		//var_dump($data);var_dump('update');die;
		$this->person->update($id, $data, 'manager'); //修改用户信息

		if (isset($data['operaId']) && $data['operaId'] > 0) {
			$this->opera->update($data['operaId'], array('uid' => $data['uid']), 'manager');
		}
		echo 1;
	}

	public function delWork($id) {
		/*if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
			            die('权限不足！');
		*/
		//var_dump($id);die;
		$this->person->delWork($id);
		echo 1;
	}
	public function pubMan(PersonRequest $request) {
		$data = $request->all();
		unset($data['_url']);
		$data['password'] = md5(md5('123456') . 'fuck_salt');
		$data['isPubed'] = 1;
		// var_dump($data);die();
		$return = $this->person->update($data['uid'], $data, 'article');
		//var_dump($return);die();
		echo 1;
	}
	public function destroy($id) {
		if (!user('object')->can('manage_users') || !user('object')->can('manage_system')) {
			die('权限不足！');
		}
		//
		$this->person->destroy($id, 'article');
		// return redirect()->route('admin.article.index')->with('message', '删除文章成功！');
		echo 1;
	}
}
