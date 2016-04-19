@extends('layout._back')

@section('content-header')
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid-theme.min.css" />
<style>
  input,select{border: 1px solid #cccccc;border-radius: 4px;}
  .jsgrid-table{width: 100%!important}
  .jsgrid-pager-container .jsgrid-pager-current-page {
      background: #c4e2ff;
      color: #fff;
  }
  .jsgrid-table td,.jsgrid-table th{padding:0!important}
  td button.btn-sm:not(.checkbox-toggle){    text-overflow: ellipsis;
    overflow: hidden;
    width: 50px;
    padding: 5px;}
</style>
@parent
    <button class="btn btn-primary" id="pubOpera"><i class="fa fa-fw fa-plus"></i> 发布</button>&nbsp;
    <ol class="breadcrumb">
      <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
      <li class="active">剧目管理</li>
    </ol>
@stop

@section('content')

      @if(Session::has('message'))
        <div class="alert alert-success alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4>  <i class="icon fa fa-check"></i> 提示！</h4>
          {{ Session::get('message') }}
        </div>
      @endif

      <div class="nav-tabs-custom">
          
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">未发布</a></li>
            <li><a href="#tab_2" data-toggle="tab" aria-expanded="false">已发布</a></li>
          </ul>

          <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              <div id="unpub"></div>
              <div id="unpubPager"></div>
              </div>
          
              <div class="tab-pane" id="tab_2">
              <div id="pubed"></div>
              <div id="pubedPager"></div>
              </div>
          </div>
      </div>
          <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title text-center row" id="myModalLabel">
               <span class="pull-left"><i class="icon fa fa-user"></i> 联系人资料</span><span id="modalTitle"></span>
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

<!-- jsgrid -->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.css" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.js"></script>
<script type="text/javascript" src="{{ asset('plugins/jsgrid-1.4.1/zh.js') }}"></script>
<script>
  var operaController = '{{ route("admin.opera.index") }}';
  var _token = '{{ csrf_token() }}';
</script>
<script src="{{ asset('plugins/jsgrid-1.4.1/business.js') }}" type="text/javascript"></script>
<script src="{{ asset('static/js/bootstrap-hover-dropdown.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')

@stop