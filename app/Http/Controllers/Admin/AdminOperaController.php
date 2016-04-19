<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\OperaRequest;  //请求层
use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Douyasi\Repositories\OperaRepository;  //模型仓库层
use Douyasi\Repositories\FlagRepository;  //推荐位仓库层
use Douyasi\Cache\DataCache;
use Cache;

/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminOperaController extends BackController
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
        OperaRepository $content,
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
        return view('back.opera.index');
    }
    
    public function tagsData(Request $request)
    {
        $tags = $this->content->tags();
        $returnTags = [];
        foreach ($tags as $k => $val) {
            $category = [];
            $idArr = explode(',', $val['ids']);
            $labelArr = explode(',', $val['labels']);
            foreach ($idArr as $k_c => $val_c) {
                $label= isset($labelArr[$k_c])?$labelArr[$k_c]:'';
                array_push($category, ['id'=>$val_c,'name'=>$labelArr[$k_c]]);
            }
            $returnTags[$val['category']] = $category;
        }
        echo json_encode($returnTags,JSON_NUMERIC_CHECK);
    }

    public function indexData(Request $request,$pubStatus)
    {
        $data = [];
        $searchFields = array('name','invest','categoryC','topicC1','site','startTimeC','periodC','runTime','outline');
        foreach ($searchFields as $k => $val) {
            $data[$val] = $request->input($val);
        }
        $data['pubStatus'] = $pubStatus;
        $operas = $this->content->index($data, 'article', Cache::get('page_size', '10'));
        // var_dump($operas);die();
        echo json_encode($operas);
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
        // var_dump($data);die();
        $content = $this->content->store($data, user('id'));  //使用仓库方法存储
        if ($content->id) {  //添加成功
            echo json_encode($content,JSON_NUMERIC_CHECK);
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
    public function pubOpera(Request $request,$ids)
    {
        if (! user('object')->can('manage_users') || ! user('object')->can('manage_system')) {
            die('权限不足！');
        }
        $ids = explode(',',$ids);
        $this->content->pubOpera($ids);
        echo 1;
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
        echo 1;
        // return redirect()->route('admin.opera.index')->with('message', '删除剧目成功！');
    }
}
