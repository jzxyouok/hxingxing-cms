<?php

namespace Douyasi\Http\Controllers\Admin;

use Cache;
use DB;
use Douyasi\Http\Requests\PersonRequest;
use Douyasi\Extensions\Huanxin;
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

	public function __construct(PersonRepository $person, OperaRepository $opera, JobsWantRepository $jobWant, Huanxin $huanxin, Route $route) {
		parent::__construct();
		$this->person = $person;
		$this->opera = $opera;
		$this->jobWant = $jobWant;
		$this->huanxin = $huanxin;
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
		if (isset($_GET['test'])&&$_GET['test']=='updHuanxinData') {
			$uids = $this->person->backendPubedUids();
			var_dump('后台发布的uid:',$uids,'<hr/>');
			// die();

			// $this->huanxin->deleteUsers($uids);
			$hxExist = $this->huanxin->getUsers(300);
			// var_dump('环信用户列表:',$hxExist,'<hr/>');
			$hxExistUids = [];
			foreach ($hxExist['entities'] as $k => $val) {
				$originUid = str_replace(['y', 'z'], '', $val['username']);
				if (!in_array($originUid, $hxExistUids)) {
					$hxExistUids[] = $originUid;
				}
			}
			asort($hxExistUids);
			var_dump('已经存在环信uid:',$hxExistUids,'<hr/>');
			// die();

			$uids = array_diff($uids, $hxExistUids);
			var_dump('最终要注册/更新的环信uid:',$uids,'<hr/>');
			// die();

			/**
			 * update huanxin user password
			 */
			foreach ($uids as $k => $val) {
				$this->huanxin->resetPassword($val."y", "5667ae347f001d14e4864f70223b1f55");
				$this->huanxin->resetPassword($val."z", "5667ae347f001d14e4864f70223b1f55");
			}

			/**
			 * createUsers
			 */
			/*$users = [];
			foreach ($uids as $k => $val) {
				// avoid too big curl data
				// if ($val<487) {
					$roles = ['y','z'];
					foreach ($roles as $kR => $valR) {
						$users[] = ['username'=>$val.$valR,'password'=>'e3d66c3f388ccdad8907f4f3509a898c'];
					}
				// }
			}
			var_dump($users,'<hr/>');
			die();
			$hxRegRes = $this->huanxin->createUsers($users);*/
			// var_dump($hxRegRes);die();
		}

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
		$res = $this->person->update($id, $data, 'manager'); //修改用户信息

		if (isset($data['operaId']) && $data['operaId'] > 0) {
			$this->opera->update($data['operaId'], array('uid' => $data['uid']), 'manager');
		}
		echo $res;
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
		$data['password'] = md5(md5(md5('123456f4iU3T9GFIkmGB^O')) . 'fuck_salt');
		// var_dump($data['password']);die();
		$data['isPubed'] = 1;
        $data['mobile'] = $data['mobile'];
		//$data['pubMobile'] = $data['mobile'];
		// var_dump($data);die();

		$returnStatus = 1;
		$returnMsg = '成功';
		DB::beginTransaction();
		$pubRes = $this->person->update($data['uid'], $data, 'article');
		// var_dump($pubRes);die();

		// reg huanxin
		if ($pubRes) {
			$hxRegRes = $this->huanxin->createUsers([
				["username" => $data['uid'] . 'y', "password" => $data['password']],
				["username" => $data['uid'] . 'z', "password" => $data['password']],
			]);
			// var_dump($hxRegRes);die();
			if (isset($hxRegRes['error'])) {
				$returnStatus = 0;
				$returnMsg = '注册环信失败';
				DB::rollback();
			}
		}else{
			$returnStatus = 0;
			$returnMsg = '发布失败';
		}
		DB::commit();
		echo json_encode(['status'=>$returnStatus,'msg'=>$returnMsg]);
	}
	public function destroy($id) {
		if (!user('object')->can('manage_users') || !user('object')->can('manage_system')) {
			die('权限不足！');
		}
		//
		//$this->person->destroy($id, 'article');
		// return redirect()->route('admin.article.index')->with('message', '删除文章成功！');
		//echo 1;

        $returnStatus = 1;
        $returnMsg = '成功';
        DB::beginTransaction();
        $res = $this->person->destroy($id, 'article');
        // var_dump($pubRes);die();

        // reg huanxin
        if ($res) {
            $HuanXin = new HuanXin();
            $hxRegRes = $HuanXin->hxDelateUsers($id);
            // var_dump($hxRegRes);die();
            if (isset($hxRegRes['error'])) {
                $returnStatus = 0;
                $returnMsg = '删除环信失败';
                DB::rollback();
            }
        }else{
            $returnStatus = 0;
            $returnMsg = '删除失败';
        }
        DB::commit();
        echo json_encode(['status'=>$returnStatus,'msg'=>$returnMsg]);
	}

    public function updatePwd($id){
        if (!user('object')->can('manage_users') || !user('object')->can('manage_system')) {
            die('权限不足！');
        }
        //
        //$this->person->destroy($id, 'article');
        // return redirect()->route('admin.article.index')->with('message', '删除文章成功！');
        //echo 1;

        $returnStatus = 1;
        $returnMsg = '成功';
        DB::beginTransaction();
        $res = $this->person->destroy($id, 'article');
        // var_dump($pubRes);die();

        // reg huanxin
        if ($res) {
            $HuanXin = new HuanXin();
            $hxRegRes = $HuanXin->hxDelateUsers($id);
            // var_dump($hxRegRes);die();
            if (isset($hxRegRes['error'])) {
                $returnStatus = 0;
                $returnMsg = '删除环信失败';
                DB::rollback();
            }
        }else{
            $returnStatus = 0;
            $returnMsg = '删除失败';
        }
        DB::commit();
        echo json_encode(['status'=>$returnStatus,'msg'=>$returnMsg]);
    }
}
