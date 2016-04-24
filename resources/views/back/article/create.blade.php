@extends('layout._back')

@section('content-header')
@parent
    <h1>撰写新文章  <button class="btn btn-warning" id="submitDraftBtn">保存为草稿</button>&nbsp;&nbsp;<button class="btn btn-primary" id="submitPubBtn">保存并发布</button></h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
      <li><a href="{{ route('admin.article.index') }}">内容管理 - 文章</a></li>
      <li class="active">撰写新文章</li>
    </ol>
    <style>
    .form-group:last-child{margin-bottom:0 }
    .content-wrapper{overflow: hidden;}
    </style>
@stop

@section('content')

          @if(Session::has('fail'))
            <div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4>  <i class="icon icon fa fa-warning"></i> 提示！</h4>
              {{ Session::get('fail') }}
            </div>
          @endif

          @if($errors->any())
            <div class="alert alert-danger alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4><i class="icon fa fa-ban"></i> 警告！</h4>
                  <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                  </ul>
            </div>
          @endif

              <!-- <h2 class="page-header">撰写新文章</h2> -->
              <form id="article_form" method="post" action="{{ route('admin.article.store') }}" accept-charset="utf-8" class="form-horizontal">
              <input type="hidden" name="_token" value="{{ csrf_token() }}">
              <div class="nav-tabs-custom col-md-12">
                  
                  <!-- <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">主要内容</a></li>
                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">附加内容</a></li>
                  </ul> -->

                  <div class="tab-content">
                    
                    <div class="tab-pane active" id="tab_1">
                      <div class="form-group">
                        <label class="col-md-1 control-label">标题 <small class="text-red">*</small></label>
                        <div class="col-md-11"><input type="text" class="form-control" name="title" id="title" autocomplete="off" value="{{ Input::old('title') }}" placeholder="标题"></div>
                      </div>
                      <!-- <div class="form-group">
                        <label>推荐位属性</label>
                        <div class="input-group">
                          @foreach($flags as $flag)
                          <input type="checkbox" name="flag[]" value="{{ $flag->attr }}">
                          <label class="choice" for="flag[]" title="{{ $flag->description }}">[{{ $flag->attr }}]{{ $flag->display_name }}</label>
                          @endforeach
                        </div>
                      </div> -->
                      <div class="form-group">
                        <label class="col-md-1 control-label">缩略图  <a href="javascript:void(0);" class="uploadPic" data-id="thumb"><i class="fa fa-fw fa-picture-o" title="上传"></i></a>  <a href="javascript:void(0);" class="previewPic" data-id="thumb"><i class="fa fa-fw fa-eye" title="预览小图"></i></a></label>
                        <div class="col-md-11"><input type="text" class="form-control" id="thumb" name="thumb" value="{{ Input::old('thumb') }}" placeholder="缩略图地址：如{{ url('') }}/assets/img/yas_logo.png"></div>
                      </div>
                      <div class="row">
                      <div class="col-md-4">
                        <label class="pull-left control-label">分类 <small class="text-red">*</small></label>
                        <div class="input-group pull-left">
                          <select data-placeholder="选择文章分类..." class="chosen-select" style="min-width:200px;" name="category_id">
                          @foreach ($returnC as $category)
                            <optgroup>
                              @foreach ($category as $cate)
                                <option value="{{ $cate['id'] }}">{{ $cate['name'] }}</option>
                              @endforeach
                            </optgroup>
                          @endforeach
                          </select>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <label class="pull-left control-label">是否置顶</label>
                        <div class="input-group pull-left">
                          <input type="radio" name="is_top" value="0" checked>
                          <label class="choice" for="radiogroup">否</label>
                          <input type="radio" name="is_top" value="1">
                          <label class="choice" for="radiogroup">是</label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <label class="pull-left control-label">显示作者 <small class="text-muted"></small></label>
                        <div class="pull-left"><input type="text" class="form-control" name="author" autocomplete="off" value="{{ Input::old('author', user('nickname')) }}" placeholder="作者"></div>
                      </div>
                      </div>
                      <div class="form-group">
                        <textarea class="form-control" id="ckeditor" name="content">{{ Input::old('content') }}</textarea>
                        @include('scripts.endCKEditor'){{-- 引入CKEditor编辑器相关JS依赖 --}}
                      </div>
                    </div><!-- /.tab-pane -->
                    <div class="tab-pane" id="tab_2">
                      <div class="form-group">
                        <label>外链地址</label>
                        <input type="text" class="form-control" name="outer_link" value="{{ Input::old('outer_link') }}" placeholder="http://example.com/">
                      </div>
                      <!-- <div class="form-group">
                        <label>是否置顶 <small class="text-red">*</small></label>
                        <div class="input-group">
                          <input type="radio" name="is_top" value="0" checked>
                          <label class="choice" for="radiogroup">否</label>
                          <input type="radio" name="is_top" value="1">
                          <label class="choice" for="radiogroup">是</label>
                        </div>
                      </div> -->
                    </div><!-- /.tab-pane -->
                  </div><!-- /.tab-content -->
                  
              </div>
              </form>
          <div id="layerPreviewPic" class="fn-hide">
            
          </div>

@stop

@section('extraPlugin')

  <!--引入Layer组件-->
  <script src="{{ asset('plugins/layer/layer.min.js') }}"></script>
  <!--引入iCheck组件-->
  <script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>
  <!--引入Chosen组件-->
  <script src="{{ asset('static/js/hongka.js') }}" type="text/javascript"></script>



</script>
  @include('scripts.endChosen')

@stop


@section('filledScript')
        $("#submitDraftBtn").click(function() {
          $("#article_form").append('<input type="hidden" name="is_draft" value="1"/>');
          $("#article_form").submit();
        });
        $("#submitPubBtn").click(function() {
            $("#article_form").append('<input type="hidden" name="is_draft" value="0"/>');
            $("#article_form").submit();
        });
        $('#title').select();
        <!--启用iCheck响应checkbox与radio表单控件-->
        $('input[type="radio"]').iCheck({
          radioClass: 'iradio_flat-blue',
          increaseArea: '20%' // optional
        });
        $('input[type="checkbox"]').iCheck({
          checkboxClass: 'icheckbox_flat-blue',
          increaseArea: '20%' // optional
        });
        @include('scripts.endSinglePic') {{-- 引入单个图片上传与预览JS，依赖于Layer --}}
@stop
