@extends('layout._back')

@section('content-header')
@parent
          <h1>新增职位</h1>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li><a href="{{ route('admin.article.index') }}">职位管理</a></li>
            <li class="active">新增职位</li>
          </ol>
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

              <!-- <h2 class="page-header">新增管理员</h2> -->
              <form method="post" action="{{ route('admin.user.store') }}" accept-charset="utf-8">
              <input type="hidden" name="_token" value="{{ csrf_token() }}">
              <div class="nav-tabs-custom">
                  
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">主要信息</a></li>
                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">其他</a></li>
                  </ul>

                  <!--<div class="tab-content">
                    
                    <div class="tab-pane active" id="tab_1">
                      
                    </div> /.tab-pane
                    <div class="tab-pane" id="tab_2">
                      
                    </div> /.tab-pane

                    <button type="submit" class="btn btn-primary">保存</button>

                  </div> /.tab-content -->
                  <div class="tab-content">

                      <div class="tab-pane active" id="tab_1">
                          <div class="form-group">
                              <label class="col-md-1 control-label">职位名 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="title" id="title" autocomplete="off" value="{{ Input::old('title') }}" placeholder="标题"></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">剧目 <small class="text-red">*</small></label>
                              <div class="input-group">
                                  <select data-placeholder="选择剧目..." class="chosen-select" style="min-width:200px;" name="">
                                      <option value="actor">actor</option>
                                      <option value="other">other</option>
                                  </select>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">演员类型 <small class="text-red">*</small></label>
                              <div class="input-group">
                                  <select data-placeholder="选择演员类型..." style="min-width:200px;" name="">
                                      <option value="actor">actor</option>
                                      <option value="other">other</option>
                                  </select>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">薪资 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="salary" id="salary" autocomplete="off" value="{{ Input::old('salary') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">说明 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">角色名 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">身高 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">年龄 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">体重 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="salary" id="salary" autocomplete="off" value="{{ Input::old('salary') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">角色说明 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">收藏 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <div class="form-group">
                              <label class="col-md-1 control-label">查看 <small class="text-red">*</small></label>
                              <div class="col-md-11"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="{{ Input::old('descrip') }}" placeholder=""></div>
                          </div>
                          <button type="submit" class="btn btn-primary">保存</button>

                      </div><!-- /.tab-pane -->
                      <div class="tab-pane" id="tab_2">
                          <div class="form-group">
                              <!--<label>外链地址</label>
                              <input type="text" class="form-control" name="outer_link" value="{{ Input::old('outer_link') }}" placeholder="http://example.com/">-->
                          </div>
                      </div><!-- /.tab-pane -->

                  </div><!-- /.tab-content -->
                  
              </div>
              </form>
          <div id="layerPreviewPic" class="fn-hide">
            
          </div>

@stop

@section('extraPlugin')

  <!--引入iCheck组件-->
  <script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>
  <!--引入Chosen组件-->
  @include('scripts.endChosen')

@stop


@section('filledScript')
        <!--启用iCheck响应checkbox与radio表单控件-->
        $('input[type="radio"]').iCheck({
          radioClass: 'iradio_flat-blue',
          increaseArea: '20%' // optional
        });
@stop
