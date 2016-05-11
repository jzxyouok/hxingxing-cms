<?php

namespace Douyasi\Models;

use Eloquent;

/**
 * 内容模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class HotWords extends Eloquent
{
    protected $connection = 'mysql_front_tables';
    protected $table = 'hot_words';
}
