@extends('layout._back')

@section('content-header')
@parent
         <!-- <a href="{{ route('admin.user.create') }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i> 新增管理员</a>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">用户管理 - 管理员</li>
          </ol>-->
@stop

@section('content')

              @if(Session::has('message'))
                <div class="alert alert-success alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4>  <i class="icon fa fa-check"></i> 提示！</h4>
                  {{ Session::get('message') }}
                </div>
              @endif

              <!-- <a href="{{ route('admin.user.create') }}" class="btn btn-primary margin-bottom">新增管理员</a> -->

              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">消息列表(第{{$index}}页)</h3>
                  <div class="box-tools">
                    <!-- <form action="{{ route('admin.user.index') }}" method="get">
                      <div class="input-group">
                        <input type="text" class="form-control input-sm pull-right" name="s_name" value="{{ Input::get('s_name') }}" style="width: 150px;" placeholder="搜索用户登录名或昵称或真实姓名">
                        <input type="text" class="form-control input-sm pull-right" name="s_phone" value="{{ Input::get('s_phone') }}" style="width: 150px;" placeholder="搜索用户手机号">
                        <div class="input-group-btn">
                          <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                      </div>
                    </form> -->
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                  <table class="table table-hover table-bordered">
                    <tbody>
                      <!--tr-th start-->
                      <tr>
                        <th>发言</th>
                        <th>时间</th>
                        <th>消息</th>
                      </tr>
                      <!--tr-th end-->
                      @foreach ($groups as $k=>$group)

                        <tr>
                          <td colspan="3">{{ $k }}</td>
                        </tr>
                        @foreach ($group as $message)
                          <tr>
                              <td>{{ $message['from'] }}</td>
                              <td>{{ $message['timestamp'] }}</td>
                              <td>{{ $message['msg'] }}</td>
                          </tr>
                        @endforeach
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                </div>



              </div>
@if($lastButton)
  <a href="{{ route('admin.msg.index',['page'=>-1]) }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i>上一页</a>
@endif

@if($nextButton)
  <a href="{{ route('admin.msg.index',['page'=>+1]) }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i>下一页</a>
@endif

@stop


@section('filledScript')
        <!--jQuery 提交表单，实现DELETE删除资源-->

@stop
