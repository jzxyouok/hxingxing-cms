<?php
namespace Douyasi\Extensions;

use Douyasi\Extensions\UmengIOSNotification;


class UmengIosPush extends UmengIOSNotification {
	protected $appkey           = NULL; 
	protected $appMasterSecret     = NULL;
	protected $timestamp        = NULL;
	protected $validation_token = NULL;

	function __construct() {
		parent::__construct();
		$this->data["type"] = "broadcast";
		$this->appkey = "5720328767e58ef2c8001e16";
		$this->appMasterSecret = "38sr5bubpsyorzmf8syymhlkg6p39gfq";
		$this->timestamp = strval(time());
	}

	function sendIosBroadcast($title='',$extraData=[]) {
		try {
			// $brocast = new IOSBroadcast();
			$this->setAppMasterSecret($this->appMasterSecret);
			$this->setPredefinedKeyValue("appkey",           $this->appkey);
			$this->setPredefinedKeyValue("timestamp",        $this->timestamp);

			$this->setPredefinedKeyValue("alert", $title);
			$this->setPredefinedKeyValue("badge", 0);
			$this->setPredefinedKeyValue("sound", "chime");
			// Set 'production_mode' to 'true' if your app is under production mode
			$this->setPredefinedKeyValue("production_mode", "false");
			// Set customized fields
			$this->setCustomizedField($extraData);
			// print("Sending broadcast notification, please wait...\r\n");
			$this->send();
			// print("Sent SUCCESS\r\n");
		} catch (Exception $e) {
			print("IosBroadcast exception: " . $e->getMessage());
		}
	}
}
