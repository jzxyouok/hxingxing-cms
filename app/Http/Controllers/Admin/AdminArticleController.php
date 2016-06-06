<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\ArticleRequest;  //请求层
use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Douyasi\Repositories\ContentRepository;  //模型仓库层
use Douyasi\Repositories\FlagRepository;  //推荐位仓库层
use Douyasi\Cache\DataCache;
use Cache;
use Douyasi\Extensions\UmengAndroidPush;
use Douyasi\Extensions\UmengIosPush;

/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminArticleController extends BackController
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
        ContentRepository $content, UmengAndroidPush $umengAndroidPush,UmengIosPush $umengIosPush,
        FlagRepository $flag)
    {
        parent::__construct();
        $this->content = $content;
        $this->flag = $flag;
        $this->umengAndroidPush = $umengAndroidPush;
        $this->umengIosPush = $umengIosPush;
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

        $data = [
            's_title' => $request->input('s_title'),
            's_cat_id' => $request->input('s_cat_id', 0),
        ];
        $_data = $request->all();
        $tab = isset($_data['tab']) ? (is_numeric($_data['tab']) ? $_data['tab']: 0 ) :0;
        //使用仓库方法获取文章列表
        $draft_articles = $this->content->index($data,1, array('1', '2','3'), Cache::get('page_size', '10'));
        $pub_articles = $this->content->index($data, 0,array('1', '2','3'), Cache::get('page_size', '10'));
        //var_dump($draft_articles);var_dump($pub_articles);die;
        //注意：因为已经使用 Bootstrap 后台模版，故无须再传入自定义的分页样式
        //传入自定义的分页Presenter
        //$links = page_links($articles, $data);
        $flags = $this->flags;
        $canDel = true;
        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
            $canDel = false;
        }
        return view('back.article.index', compact('draft_articles','pub_articles', 'flags', 'canDel','tab'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //需传递分类信息进去
        $categories = $this->content->meta();
        $returnC = [];
        foreach($categories->toArray() as $val) {
            $returnC[$val['slug']][] = $val;
        }
        $flags = $this->flag->index();
        //var_dump($returnC);var_dump("<br/>");var_dump($flags);die;
        return view('back.article.create', compact('returnC', 'flags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(ArticleRequest $request)
    {
        $data = $request->all();  //获取请求过来的数据
        $content = $this->content->store($data, 'article', user('id'));  //使用仓库方法存储
        if ($content->id) {  //添加成功
            $simpleContent = str_replace(["\r\n", "\r", "\n"], "", preg_replace("/&#?[a-z0-9]+;/i","",mb_substr(strip_tags($data['content']),0,20,'utf-8')));
            $this->umengPush(!$data['is_draft'],$content->id,$data['category_id'],$data['title'],$simpleContent);
            return redirect()->route('admin.article.index')->with('message', '成功发布新文章！');
        } else {  //添加失败
            return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
        }
    }
    // umengPush
    public function umengPush($push=false,$articleId,$category_id,$title='',$simpleContent='') {
        if ($push) {
            $extraData = ['articleType'=>$category_id,'articleUrl'=>'http://www.hxingxing.com/news/'.$articleId];
            // $this->umengAndroidPush->sendAndroidBroadcast('新的文章',$title,$simpleContent,$extraData,'http://www.hxingxing.com/news/'.$articleId);
            $this->umengIosPush->sendIOSBroadcast($title,$extraData);

            $this->content->update($articleId, ['umengPushed'=>1], 'article');
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
        $returnC = [];
        foreach($categories->toArray() as $val) {
            $returnC[$val['slug']][] = $val;
        }
        $article = $this->content->edit($id, 'article');
        //已经findOrFail处理，如果不存在该id资源会抛出异常，再加is_null判定无意义
        //is_null($article) and abort(404);
        $flags = $this->flag->index();
        return view('back.article.edit', ['data' => $article, 'returnC' => $returnC, 'flags' => $flags]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Douyasi\Http\Requests\ArticleRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(ArticleRequest $request, $id)
    {
//        if ($_SERVER['REMOTE_ADDR'] !== '27.154.55.210') {
//            return redirect()->route('admin.article.index')->with('fail', '没有权限进行文章修改炒作！');
//            //die('没有权限进行文章修改炒作！');
//        }
        $data = $request->all();/*var_dump($data)*///;die;

        // 没推过并且现在发布
        $simpleContent = str_replace(["\r\n", "\r", "\n"], "", preg_replace("/&#?[a-z0-9]+;/i","",mb_substr(strip_tags($data['content']),0,20,'utf-8')));
        $this->umengPush(!$data['umengPushed']&&!$data['is_draft'],$id,$data['category_id'],$data['title'],$simpleContent);
        unset($data['umengPushed']);
        $this->content->update($id, $data, 'article');
        return redirect()->route('admin.article.index')->with('message', '修改文章成功！');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id){
        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
            // return redirect()->route('admin.article.index')->with('fail', '权限不足！');
            die('权限不足！');
        }
        //
        $this->content->destroy($id, 'article');
        // return redirect()->route('admin.article.index')->with('message', '删除文章成功！');
        echo 1;
    }
    public function updViewNum($id,$num,$is_show){
        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
            die('权限不足！');
        }
        $this->content->updViewNum($id,$num,$is_show);
        echo 1;
    }
    public function delComment($id,$newsId){
        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
            die('权限不足！');
        }
        $this->content->delComment($id,$newsId);
        echo 1;
    }
}
