<?php

namespace Douyasi\Extensions;
use Douyasi\Extensions\Easemob;

class Huanxin extends Easemob {
	public function __construct() {
		$options['client_id'] = 'YXA6GE-eINUnEeWsSV3hfNAN8Q';
		$options['client_secret'] = 'YXA60AK_25-5gNGQ1D_rUzjZrqnaYsI';
		$options['org_name'] = 'shiheng2015';
		$options['app_name'] = 'hongka';
		parent::__construct($options);
	}
}
