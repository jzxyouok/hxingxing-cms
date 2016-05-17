<?php
namespace Douyasi\Extensions;

use Douyasi\Extensions\UmengAndroidNotification;


class UmengAndroidPush extends UmengAndroidNotification {
	protected $appkey           = NULL; 
	protected $appMasterSecret     = NULL;
	protected $timestamp        = NULL;
	protected $validation_token = NULL;

	function __construct() {
		parent::__construct();
		$this->data["type"] = "broadcast";
		$this->appkey = "57281d6fe0f55a3398001e0d";
		$this->appMasterSecret = "cmnn5mlhyqrj76zvjb3uhwlbop5qz247";
		$this->timestamp = strval(time());
	}

	function sendAndroidBroadcast($ticker='',$title='',$text='',$extraData=[]) {
		try {
			// $brocast = new AndroidNotification();
			$this->setAppMasterSecret($this->appMasterSecret);
			$this->setPredefinedKeyValue("appkey",           $this->appkey);
			$this->setPredefinedKeyValue("timestamp",        $this->timestamp);
			$this->setPredefinedKeyValue("ticker",           $ticker);
			$this->setPredefinedKeyValue("title",            $title);
			$this->setPredefinedKeyValue("text",             $text);
			$this->setPredefinedKeyValue("after_open",       "go_app");
			// Set 'production_mode' to 'false' if it's a test device. 
			// For how to register a test device, please see the developer doc.
			$this->setPredefinedKeyValue("production_mode", "true");
			// [optional]Set extra fields
			$this->setExtraField($extraData);
			// print("Sending Android broadcast notification, please wait...\r\n");
			$this->send();
			// print("Sent Android SUCCESS\r\n");
		} catch (Exception $e) {
			print("AndroidBroadcast exception: " . $e->getMessage());
		}
	}
}
