<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
 */

#Laravel 5.1 默认路由
/*Route::get('/ddd', function () {
$img= Image::make('test.jpg')->fit(540, 360, function ($constraint) {
$constraint->upsize();
});
return $img->response('jpg');
});*/

//added some test routes

#对后台开启csrf过滤
// Route::when('admin/*', 'csrf', ['post', 'delete', 'put']);

/*
|--------------------------------------------------------------------------
| 基础权限 登录注册找回密码等操作
|--------------------------------------------------------------------------
 */
Route::group(['prefix' => 'auth'], function () {
	$Authority = 'AuthorityController@';
	# 退出
	Route::get('logout', ['as' => 'logout', 'uses' => $Authority . 'getLogout']);
	# 登录
	Route::get('login', ['as' => 'login', 'uses' => $Authority . 'getLogin']);
	Route::post('login', $Authority . 'postLogin');
});

/*
|--------------------------------------------------------------------------
| 管理员后台 实现文章和用户等管理操作
|--------------------------------------------------------------------------
 */
Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function () {

# 后台首页
	$Admin = 'AdminController@';
	# 访问后台首页 会 重定向至 后台控制台概要页面 （在控制器方法getIndex中处理）
	Route::get('/', ['as' => 'admin', 'uses' => $Admin . 'getIndex']);

# 后台上传图片文件layer
	Route::get('/upload', ['as' => 'admin.upload', 'uses' => $Admin . 'getUpload']);
	Route::post('/upload', ['as' => 'admin.upload.store', 'uses' => $Admin . 'postUpload']);

#重建缓存（更新内容或者刚安装完本CMS之后，如果数据显示异常，请点击后台导航中“重建缓存”链接）
	Route::get('/cache', ['as' => 'admin.cache', 'uses' => $Admin . 'getRebuildCache']);

#--------------------
	# 控制台 START
	#--------------------

	Route::group(['prefix' => 'console'], function () {
		$resource = 'admin.console';
		$controller = 'Admin\AdminConsoleController@';
		Route::get('/', ['as' => $resource . '.index', 'uses' => $controller . 'getIndex']);
		Route::post('/ajaxArticleCount', $controller . 'ajaxArticleCount');
		Route::post('/ajaxOperaCount', $controller . 'ajaxOperaCount');
		Route::post('/ajaxJobsWantCount', $controller . 'ajaxJobsWantCount');
	});
#--------------------
	# 控制台 END
	#--------------------

#--------------------
	# 内容管理 START
	#--------------------
	Route::post('/opera/pubOpera/{ids}', 'Admin\AdminOperaController@pubOpera');
	Route::post('/jobsWant/pubWant/{ids}', 'Admin\AdminJobsWantController@pubWant');
	Route::get('/opera/indexData/{pubStatus}', 'Admin\AdminOperaController@indexData');
	Route::get('/opera/tagsData', 'Admin\AdminOperaController@tagsData');
	Route::get('/jobsWant/tagsData', 'Admin\AdminJobsWantController@tagsData');
	Route::get('/jobsWant/indexData/{pubStatus}', 'Admin\AdminJobsWantController@indexData');
	Route::get('/hotWords/indexData', 'Admin\AdminHotWordsController@indexData');
	Route::post('/opera/pushMsg', 'Admin\AdminOperaController@pushMsg');
	Route::post('/person/pubMan', 'Admin\AdminPersonController@pubMan');
	Route::post('/opera/checkOpera', 'Admin\AdminOperaController@checkOpera');
	//Route::post('/opera/hxChatHistory', 'Admin\AdminOperaController@hxChatHistory');
	Route::post('/article/updViewNum/{id}/{num}/{is_show}', 'Admin\AdminArticleController@updViewNum');
	Route::post('/article/delComment/{id}/{newsId}', 'Admin\AdminArticleController@delComment');
	Route::post('/person/checkMobile', 'Admin\AdminPersonController@checkMobile');
	Route::post('/person/searchMobile', 'Admin\AdminPersonController@searchMobile');
	Route::post('/person/delWork/{id}', 'Admin\AdminPersonController@delWork');
	Route::resource('person', 'Admin\AdminPersonController');
	Route::resource('/feedback', 'Admin\AdminFeedbackController@index');
//	Route::resource('/hotWords', 'Admin\AdminHotWordsController@index');
    Route::resource('/hotWords', 'Admin\AdminHotWordsController');
	Route::resource('report', 'Admin\AdminReportController');
	Route::resource('opera', 'Admin\AdminOperaController');
	Route::resource('jobs', 'Admin\AdminJobsController');
	Route::resource('statistics', 'Admin\AdminStatisticsController');
    Route::resource('msg', 'Admin\AdminMsgController');

	# 文章
	Route::resource('article', 'Admin\AdminArticleController');

	# 招聘名片
	Route::resource('jobsWant', 'Admin\AdminJobsWantController');

	# 单页
	Route::resource('page', 'Admin\AdminPageController');

	#碎片
	Route::resource('fragment', 'Admin\AdminFragmentController');

	# 分类
	Route::resource('category', 'Admin\AdminCategoryController');

	# 标签
	Route::resource('tag', 'Admin\AdminTagController');

#--------------------
	# 内容管理 END
	#--------------------

#--------------------
	# 用户管理 START
	#--------------------
	#我的账户
	Route::get('/me', ['as' => 'admin.me.index', 'uses' => 'Admin\AdminMeController@getIndex']);
	Route::put('/me', ['as' => 'admin.me.update', 'uses' => 'Admin\AdminMeController@putUpdate']);

	#管理型用户
	Route::group(['prefix' => 'user'], function () {
		$resource = 'admin.user';
		$controller = 'Admin\AdminUserController@';
		Route::get('/', ['as' => $resource . '.index', 'uses' => $controller . 'index']); //管理型用户列表
		Route::get('create', ['as' => $resource . '.create', 'uses' => $controller . 'create']); //新增管理型用户
		Route::post('/', ['as' => $resource . '.store', 'uses' => $controller . 'store']); //post处理提交数据
		Route::get('{id}', ['as' => $resource . '.show', 'uses' => $controller . 'show']); //展示管理型用户个人基础信息
		Route::get('{id}/edit', ['as' => $resource . '.edit', 'uses' => $controller . 'edit']); //修改管理型用户信息
		Route::put('{id}', ['as' => $resource . '.update', 'uses' => $controller . 'update']); //put更新管理型用户信息
	});

	#角色
	Route::resource('role', 'Admin\AdminRoleController');

	#权限
	Route::get('/permission', ['as' => 'admin.permission.index', 'uses' => 'Admin\AdminPermissionController@index']);
#--------------------
	# 用户管理 END
	#--------------------

#--------------------
	# 业务管理 START
	#--------------------

	#首页
	Route::get('/business', ['as' => 'admin.business.index', 'uses' => 'Admin\AdminBusinessController@getIndex']);

	#流程
	Route::get('/flow', ['as' => 'admin.flow', 'uses' => 'Admin\AdminBusinessController@getFlow']);

#--------------------
	# 业务管理 END
	#--------------------

#--------------------
	# 系统管理 START
	#--------------------

	#动态设置 [包含动态设置分组]

	Route::resource('setting', 'Admin\AdminSettingController'); //动态设置
	Route::resource('setting_type', 'Admin\AdminSettingTypeController'); //动态设置分组

	#静态系统配置
	Route::get('/system_option', ['as' => 'admin.system_option.index', 'uses' => 'Admin\AdminSystemOptionController@getIndex']);
	Route::put('/system_option', ['as' => 'admin.system_option.update', 'uses' => 'Admin\AdminSystemOptionController@putUpdate']);

	#系统日志
	Route::resource('system_log', 'Admin\AdminSystemLogController'); //系统日志
	#--------------------
	# 系统管理 END
	#--------------------
});

/*
|--------------------------------------------------------------------------
| 网站前台博客
|--------------------------------------------------------------------------
 */

Route::group(array(), function () {
	$Blog = 'BlogController@';

	# 前台博客首页
	Route::get('/', ['as' => 'home', 'uses' => $Blog . 'getIndex']);

	# 归档页面
	Route::get('archive', ['as' => 'archive', 'uses' => $Blog . 'getArchive']);

	# 展示单页 如果单页无slug，则{page}取其id
	Route::get('{page}.html', ['as' => 'page.show', 'uses' => $Blog . 'getPageShow']);

	# 展示分类 如果分类无slug，则{category}取其id
	Route::get('{category}', ['as' => 'article.category', 'uses' => $Blog . 'getCategoryArticles']);

	# 展示文章 如果分类无slug或者其slug为数字，则将{category}拼接成'cat_{id}'形式；如果文章无slug，则{article}取其id
	Route::get('{category}/{article}.html', ['as' => 'article.show', 'uses' => $Blog . 'getArticleShow']);
});
