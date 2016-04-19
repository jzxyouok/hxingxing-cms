<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\OperaRequest;  //请求层
use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Douyasi\Repositories\PushMsgRepository;  //模型仓库层
use Douyasi\Repositories\FlagRepository;  //推荐位仓库层
use Douyasi\Cache\DataCache;
use Cache;
use Douyasi\Extensions\Easemob;
/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminPushMsgController extends BackController
{


    /**
     * The ContentRepository instance.
     *
     * @var Douyasi\Repositories\ContentRepository
     */
    protected $content;

    /**
     * The FlagRepository instance.
     *
     * @var Douyasi\Repositories\FlagRepository
     */
    protected $flag;

    /**
     * 推荐位缓存数据
     *
     * @var array
     */
    protected $flags;

    public function __construct(
        PushMsgRepository $content,
        FlagRepository $flag)
    {
        parent::__construct();
        $this->content = $content;
        $this->flag = $flag;
        if (! user('object')->can('manage_contents')) {
            $this->middleware('deny403');
        }
        if (!Cache::has('flags')) {  //如果推荐位缓存不存在
            DataCache::cacheFlags();
        }
        $this->flags = Cache::get('flags');
    }


    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $users = $this->content->persons();
        return view('back.pushMsg.index', compact('users'));
    }
    private function newEasemob(){
        $options['client_id']='YXA6GE-eINUnEeWsSV3hfNAN8Q';
        $options['client_secret']='YXA60AK_25-5gNGQ1D_rUzjZrqnaYsI';
        $options['org_name']='shiheng2015';
        $options['app_name']='hongka';
        return new Easemob($options);
    }
    public function getHxUsers(Request $request){
        $h=$this->newEasemob();
        $aaa = $h->getUsers();

        if ($aaa) {
            $users = $aaa['entities'];
            var_dump($users);die();
        }
    }
    public function pushMsg(Request $request){
        $data = $request->all();
        var_dump($data);die();
        $h=$this->newEasemob();
        $ext['a']="a";
        $ext['b']="b";
        $aaa = $h->sendText('admin','users',['35y'],'hello',$ext);
        var_dump($aaa);die();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //需传递分类信息进去
        // $categories = $this->content->meta();
        // $flags = $this->flag->index();
        // return view('back.opera.create', compact('categories', 'flags'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(OperaRequest $request)
    {
        $data = $request->all();  //获取请求过来的数据

        $content = $this->content->store($data, 'article', user('id'));  //使用仓库方法存储
        if ($content->id) {  //添加成功
            // return redirect()->route('admin.opera.index')->with('message', '成功发布新文章！');
            echo json_encode($content);
        } else {  //添加失败
            return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
        }
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
        $categories = $this->content->meta();
        $article = $this->content->edit($id, 'article');
        //已经findOrFail处理，如果不存在该id资源会抛出异常，再加is_null判定无意义
        //is_null($article) and abort(404); 
        $flags = $this->flag->index();
        return view('back.opera.edit', ['data' => $article, 'categories' => $categories, 'flags' => $flags]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Douyasi\Http\Requests\OperaRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(OperaRequest $request, $id)
    {
        //
        $data = $request->all();
        $this->content->update($id, $data, 'article');
        // return redirect()->route('admin.article.index')->with('message', '修改文章成功！');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($ids)
    {
        $this->content->destroy($ids, 'article');
        return redirect()->route('admin.opera.index')->with('message', '删除剧目成功！');
    }
}
