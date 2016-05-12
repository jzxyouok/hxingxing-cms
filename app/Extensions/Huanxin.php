<?php

namespace Douyasi\Extensions;

use Douyasi\Extensions\Easemob; //模型仓库层
/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Huanxin {

	/**
	 * The ContentRepository instance.
	 *
	 * @var Douyasi\Repositories\ContentRepository
	 */

	/**
	 * 推荐位缓存数据
	 *
	 * @var array
	 */

	public function __construct() {
		$options['client_id'] = 'YXA6GE-eINUnEeWsSV3hfNAN8Q';
		$options['client_secret'] = 'YXA60AK_25-5gNGQ1D_rUzjZrqnaYsI';
		$options['org_name'] = 'shiheng2015';
		$options['app_name'] = 'hongka';
		$this->huanXin = new Easemob($options);
	}
	
	public function getHxUsers(OperaRequest $request) {
		$aaa = $this->huanXin->getUsers();

		if ($aaa) {
			$users = $aaa['entities'];
			var_dump($users);die();
		}
	}

	public function hxPush($mobile, $content = '', $uid) {
		$simpleCard = ['uname' => '红猩猩', 'msgType' => 'likeMe', 'time' => time(), 'unread' => true, 'avatar' => 'http://112.74.86.237:8081/logo.ico'];
		// $uids = ['73y'];
		$uids[] = $uid . 'y';
		$uids[] = $uid . 'z';
		$result = $this->huanXin->sendText('admin', 'users', $uids, $content, ['data' => (object) $simpleCard]);

		$return = [];
		$ql = 'select+*+where+timestamp>1435536480000+from="admin"+and+to="' . $uid . 'y"+or+to="' . $uid . 'z"+limit=10+cursor=**';
		// $cursor=$this->huanXin->readCursor("chatfile.txt");
		$history = $this->huanXin->getChatRecord($ql);
		// var_dump($history);
		foreach ($history['entities'] as $k => $val) {
			$return[date('m-d H:i', round($val['timestamp'] / 1000))] = $val['payload']['bodies'][0]['msg'];
		}
		// var_dump($return);die();
		return $result['data'][$uid . 'y'] == 'success' && $result['data'][$uid . 'z'] == 'success' ? json_encode($return, JSON_UNESCAPED_UNICODE) : 0;
	}
	public function hxChatHistory($uid, $page) {
		$return = [];
		$ql = 'select+*+where+timestamp>1435536480000+from="admin"+and+to="' . $uid . 'y"+or+to="' . $uid . 'z"+limit=10+cursor=**';
		// $cursor=$this->huanXin->readCursor("chatfile.txt");
		$history = $this->huanXin->getChatRecord($ql);
		// var_dump($history);
		foreach ($history['entities'] as $k => $val) {
			$return[date('m-d H:i', round($val['timestamp'] / 1000))] = $val['payload']['bodies'][0]['msg'];
		}
		return $return;
	}
	function hxCreateUsers($users = []) {
		return $this->huanXin->createUsers($users);
	}
	function hxDelateUsers($uids = []) {
		foreach ($uids as $key => $value) {
			$this->huanXin->deleteUser($value."y");
			$this->huanXin->deleteUser($value."z");
		}
	}
	function getUsers($num=10) {
		return $this->huanXin->getUsers($num);
	}
}
