@extends('layout._back')

@section('content-header')
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid-theme.min.css" />
<style>
  input,select{border: 1px solid #cccccc;border-radius: 4px;}
  .jsgrid-table{width: 100%!important}
  .jsgrid-pager-container .jsgrid-pager-current-page {background: #c4e2ff;color: #fff;
  }
  .jsgrid-table td,.jsgrid-table th{padding:0!important}
  td a.btn-sm:not(.checkbox-toggle){text-overflow: ellipsis;
    overflow: hidden;
    width: 50px;
    padding: 5px;}
    .panel-heading h3 {padding-top: 8px;}
    .panel-heading{padding: 5px 15px}
    .modal .alert{padding: 6px 15px;margin-bottom: 0;display: none}
    .error{color: red;border-color: red;}
</style>
@parent

    <!--<ol class="breadcrumb">
      <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
      <li class="active">剧目管理</li>
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

      <div class="nav-tabs-custom">
          
          <ul id="mainTab" class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">未发布</a></li>
<!--            <li><a href="#tab_2" data-toggle="tab" aria-expanded="false">已发布</a></li>-->
          </ul>

          <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              <div id="unpub"></div>
              <div id="unpubPager"></div>
              </div>
          
              <!--<div class="tab-pane" id="tab_2">
                <div id="pubed"></div>
                <div id="pubedPager"></div>
              </div>-->
          </div>
      </div>
          <!-- 模态框（Modal） -->

@stop

@section('extraPlugin')
<!--引入iCheck组件-->
<script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>

<!-- jsgrid -->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.css" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.js"></script>
<script type="text/javascript" src="{{ asset('plugins/jsgrid-1.4.1/zh.js') }}"></script>

<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
  var operaController = '{{ route("admin.jobsWant.index") }}';
  var personController = '{{ route("admin.person.index") }}';
  var checkMobileController = '{{ route("admin.person.index") }}/checkMobile';

  var _token = '{{ csrf_token() }}';
  var rowIndex,statusTable;
  var token = '{{ csrf_token() }}';


    $('body').on('click','.jsgrid-pager-page a',function () {
        setIcheck();
    });
    
    var deleteSelectedItems = function() {
        if(!selectedItems.length || !confirm("确定删除吗?"))
            return;
 
        $.ajax({
            type: "POST",
            url: operaController+'/'+selectedItems,
            data: {_method:'delete',_token:_token}
        }).done(function() {
            $.each(selectedItems, function(_, item) {
                $("#unpub").jsGrid("deleteItem", item);
            });
            selectedItems = [];
        });
    };
</script>
<script src="{{ asset('plugins/jsgrid-1.4.1/jobsWant.js') }}" type="text/javascript"></script>
<script src="{{ asset('static/js/bootstrap-hover-dropdown.js') }}" type="text/javascript"></script>

<script src="{{ asset('static/js/jquery.form.js') }}" type="text/javascript"></script>
<script src="{{ asset('static/js/jquery.validate.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
    $.fn.serializeObject = function(){
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

    var modalForm = $('#modalForm');
    var validator= modalForm.validate({
      onkeyup:false,
        focusInvalid:false,
        rules:{
          contactName:{required:true},
          mobile: {required:true,
            remote:{url: checkMobileController, type:"post",dataType:"json",
              data: {uid: function(){return $("#modalForm #uid").val();},mobile: function(){return $("#modalForm #realMobile").val();}}
            }
          },
        },
        messages:{
          contactName:{required:'必填项'},
          mobile:{required:'请输入手机号',remote:'已经存在'},
        },
        submitHandler: function(form) {
          var self = $('#commitModal');

          var item = modalForm.serialize();
          var oldContact= modalForm.serializeObject();
          var uid= $('#uid').val();
          console.log(uid);

          item._token=_token;
          if (uid>0) {
              var method = 'PUT';
              var url = personController+'/'+uid;
          }else{
              var method = 'post';
              var url = personController;
          }
          $.ajax({
              type: method,
              url: url,
              data: item,
              beforeSend: function( xhr ) {
                  self.prop('disabled', true);
              },
              error: function( xhr ) {
                  self.next().text('操作失败').removeClass('alert-success').addClass('alert-warning').show();
              },
              complete: function( xhr ) {
                  self.prop('disabled', false);
              },
          }).done(function(result) {
              var trs = $('#'+statusTable+' .jsgrid-grid-body tr:visible');
              if(uid>0){
                var modalBtn = trs.eq(rowIndex).find('.openModal');
                modalBtn.data('comment',oldContact);
              }else{
                    console.log('新增结果:'+result);
                    $('#uid').val(result);
              }

              self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
          });
        }
    });
@stop