@extends('layout._back')

@section('content-header')
<style>
  input,select{border: 1px solid #cccccc;border-radius: 4px;}
  .jsgrid-table{width: 100%!important}
  #externalPager .jsgrid-pager-current-page {
      background: #c4e2ff;
      color: #fff;
  }
  #jsGrid td{padding:0;}
</style>
@parent
    <h1>推消息</h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
      <li class="active">剧目管理</li>
    </ol>
@stop

@section('content')

      @if(Session::has('message'))
        <div class="alert alert-success alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> 提示！</h4>
          {{ Session::get('message') }}
        </div>
      @endif

      <div class="box-header with-border">
  <form action="{{ route('admin.pushMsg.index') }}" class="form-inline" role="form" method="post">
  <input type="hidden" name="_token" value="{{ csrf_token() }}">
    <div class="form-group">
      <label for="name">选择账号</label>
      <select name="" id="" class="form-control">
        @foreach ($users as $user)
          <option value="{{$user->uid}}">{{$user->name}}</option>
        @endforeach
      </select>
   </div>
   <div class="form-group">
      <label for="name">快捷消息</label>
      <select name="" id="" class="form-control"></select>
   </div>
   <div class="form-group">
    <input type="text" class="form-control">
  </div>
   <button type="submit" class="btn btn-primary"><i class="icon fa fa-location-arrow"></i> 发送</button>
</form>
                </div><!-- /.box-header -->
          
          
          <!-- 模态框（Modal） -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               联系人资料 - <span id="modalTitle"></span>
            </h4>
         </div>
         <div class="modal-body">
            <form action="" class="form-horizontal">
              <div class="form-group">
                <label for="" class="col-md-2 control-label">姓名</label>
                <div class="col-md-10"><input type="text" class="form-control" id="contactName"></div>
              </div>
              <div class="form-group">
                <label for="" class="col-md-2 control-label">虚拟手机号</label>
                <div class="col-md-10"><input type="text" class="form-control" id="contactVirtual"></div>
              </div>
              <div class="form-group">
                <label for="" class="col-md-2 control-label">手机号</label>
                <div class="col-md-10"><input type="text" class="form-control" id="contactMobile"></div>
              </div>
              <div class="form-group">
                <label for="" class="col-md-2 control-label">公司名</label>
                <div class="col-md-10"><input type="text" class="form-control" id="contactCompany"></div>
              </div>
              <div class="form-group">
                <label for="" class="col-md-2 control-label">职务</label>
                <div class="col-md-10"><input type="text" class="form-control" id="contactPosition"></div>
              </div>
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div><!-- /.modal -->
@stop

@section('extraPlugin')
<!--引入iCheck组件-->
<script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>
<script>
</script>
@stop

@section('filledScript')

@stop