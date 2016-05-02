<?php

namespace Douyasi\Models;
use Eloquent;

// use Illuminate\Auth\Authenticatable;
// use Illuminate\Database\Eloquent\Model;
/*use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Zizaco\Entrust\Traits\EntrustUserTrait;*/

/**
 * 用户模型
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class newsComment extends Eloquent
{
    
    /*use Authenticatable, CanResetPassword;
    use EntrustUserTrait;*/
    
    protected $connection = 'mysql_front_tables';
    protected $table = 'news_comment';
    /*protected $fillable = ['nickname', 'email', 'realname', 'gender', 'pid', 'pid_card_thumb1', 'pid_card_thumb2', 'avatar', 'phone', 'address', 'emergency_contact'];
    protected $hidden = ['password', 'confirmation_code', 'remember_token'];*/
    public function article(){
	    return $this->belongsTo('Douyasi\Models\Content', 'id','newsId');
	}
	public function user()
    {
        //模型名 外键 本键
        return $this->hasOne('Douyasi\Models\User', 'id', 'uid');
    }
}
