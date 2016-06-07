<?php

namespace Douyasi\Models;

use Eloquent;

/**
 * 内容模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class JobsWant extends Eloquent {
	protected $connection = 'mysql_front_tables';
	protected $table = 'jobs_want';
	/**
	 * 分类
	 * 模型对象关系：内容对应的分类[仅文章存在分类]
	 *
	 * @return Illuminate\Database\Eloquent\Relations\BelongsTo
	 */

	public function contact() {
		//模型名 外键 本键
		return $this->hasOne('Douyasi\Models\Person', 'uid', 'uid');
	}
	public function pubWant($ids) {
		return $this->whereIn('id', $ids)->update(array('pubStatus' => 1));
	}
}
