<?php

namespace Douyasi\Http\Controllers\Admin;

use Cache; //请求层
use Douyasi\Cache\DataCache;
use Douyasi\Http\Controllers\Controller; //推荐位仓库层
use Douyasi\Http\Requests\HotWordsRequest;
use Douyasi\Repositories\HotWordsRepository;
use Illuminate\Http\Request;

/**
 * 内容文章资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminHotWordsController extends BackController {

    /**
     * The ContentRepository instance.
     *
     * @var Douyasi\Repositories\ContentRepository
     */
    protected $content;

    /**
     * 推荐位缓存数据
     *
     * @var array
     */
    public function __construct(
        HotWordsRepository $content) {
        parent::__construct();
        $this->content = $content;
        if (!user('object')->can('manage_system')) {
            $this->middleware('deny403');
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request) {
        return view('back.hotWords.index');
    }

    public function indexData(Request $request) {
        $data = [];
        $searchFields = array('word', 'type');
        foreach ($searchFields as $k => $val) {
            $data[$val] = $request->input($val);
        }
        $operas = $this->content->index($data, false, Cache::get('page_size', '10'));
        echo json_encode($operas, JSON_UNESCAPED_UNICODE);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(HotWordsRequest $request) {
        $data = $request->all(); //获取请求过来的数据
//        var_dump('store');die;
        $content = $this->content->store($data, user('id')); //使用仓库方法存储
        if ($content->id) {
            //添加成功
            echo json_encode($content, JSON_NUMERIC_CHECK);
        } else {
            echo json_encode(['msg'=>'数据库操作返回异常！'], JSON_UNESCAPED_UNICODE);
        }
    }
    /**
     * Update the specified resource in storage.
     *
     * @param \Douyasi\Http\Requests\HotWordsRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(HotWordsRequest $request, $id) {
        $data = $request->all();
//        var_dump('update');die;
        return $this->content->update($id, $data, 'article');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($ids) {
        $this->content->destroy($ids, 'article');
        echo 1;
    }
}
