<?php

namespace Douyasi\Models;

use Eloquent;

/**
 * 内容模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class Tags extends Eloquent
{
	protected $connection = 'mysql_front_tables';
    protected $table = 'tree_category';
}
