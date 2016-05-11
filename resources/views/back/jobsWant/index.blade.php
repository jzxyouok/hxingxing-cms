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
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog"
aria-labelledby="contactModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center row" id="contactModalLabel">
                    <span id="modalTitle"></span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal" id="modalForm">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="pull-left panel-title"><i class="icon fa fa-user"></i> 联系人资料</h3>
                            <button type="submit" class="pull-right btn btn-primary" id="commitModal">
                                提交更改
                            </button>
                            <div class="pull-right alert alert-success">操作成功！</div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel-body">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active">
                                    <a href="#main" data-toggle="tab">主要</a>
                                </li>
                                <li><a href="#other" data-toggle="tab">备注</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="main">
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">真实姓名</label>
                                        <div class="col-md-3">
                                            <input type="hidden" name="uid" id="uid">
                                            <input type="hidden" name="jobWantId" id="jobWantId">
                                            <input type="text" class="form-control" name="name" id="contactName">
                                        </div>
                                        <label for="" class="control-label pull-left"><i class="icon fa fa-phone"></i></label>
                                        <div class="col-md-3">
                                             <input type="text" class="form-control" name="realMobile" id="realMobile" maxlength="11">
                                        </div>
                                        <input type="button" class="btn btn-primary pubMan" value="发布" />
                                        <label for="realMobile" id="realMobile-error" class="pull-left error"></label>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">虚拟姓名</label>
                                        <div class="col-md-3">
                                            <input type="text" class="form-control" name="fakeName" id="fakeName">
                                        </div>
                                          <label for="" class="control-label pull-left"><i class="icon fa fa-phone"></i></label>
                                          <div class="col-md-3">
                                              <input type="text" class="form-control" name="fakeMobile" id="fakeMobile" maxlength="11">
                                          </div>
                                        <input type="button" class="btn btn-primary pubMan" value="发布" />
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">公司</label>
                                        <div class="col-md-10"><input type="text" class="form-control" name="company" id="contactCompany"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">职务</label>
                                        <div class="col-md-10"><input type="text" class="form-control" name="position" id="contactPosition"></div>
                                    </div>
                                    <div class="row">
                                        <label for="" class="col-md-2 control-label">备注</label>
                                        <!--<div class="col-md-10"><input type="text" class="form-control" name="remark" id="remark"></div>-->
                                        <div class="col-md-10">
                                            <textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="other">
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">姓名</label>
                                        <div class="col-md-10"><input type="text" class="form-control" name="otherName" id="otherName"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-md-2 control-label">手机号</label>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" name="otherMobile" id="otherMobile">
                                        </div>
                                        <label for="mobile" id="mobile-error" class="row col-md-4 control-label error"></label>
                                    </div>
                                    <div class="row">
                                        <label for="" class="col-md-2 control-label">公司</label>
                                        <div class="col-md-10"><input type="text" class="form-control" name="otherCompany" id="otherCompany"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var operaController = '{{ route("admin.jobsWant.index") }}';
    var personController = '{{ route("admin.person.index") }}';
    var checkMobileController = '{{ route("admin.person.index") }}/checkMobile';
    var manageRole = '{{$manageRole}}';
    var _token = '{{ csrf_token() }}';
    var activeBtn;

    $('body').on('click','.openModal',function () {
        //console.log($(this).closest('tr').attr('class'));
        var contactModal = $('#contactModal');
        if($(this).closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = $(this).closest('tr.jsgrid-edit-row').next().find('.openModal');
            //console.log($(this).closest('tr.jsgrid-edit-row').next().attr('style'));
        }else{
            activeBtn = $(this);
        }

        console.log(activeBtn.attr('data-comment'));
        //清空原有数据,编辑初始化
        $('#modalForm').find('input[type="text"]','input[type="hidden"]').val('');
        contactModal.find('.alert').hide();
        contactModal.find('#jobWantId').val(activeBtn.attr('jobWantId'));
        //try{
            var commentData = JSON.parse(activeBtn.attr('data-comment'));
            //console.log(commentData);
            var artTitle = $(this).data('title');//s
            $('#modalTitle').text(artTitle);
            $('#uid').val(commentData.uid);
            $('#isPubed').val(commentData.isPubed);
            $('#contactName').val(commentData.name);
            $('#fakeName').val(commentData.fakeName);
            $('#fakeMobile').val(commentData.fakeMobile);
            $('#realMobile').val(commentData.realMobile);
            $('#contactCompany').val(commentData.company);
            $('#contactPosition').val(commentData.position);
            $('#otherName').val(commentData.otherName);
            $('#otherMobile').val(commentData.otherMobile);
            $('#otherCompany').val(commentData.otherCompany);
            $('#remark').val(commentData.remark);
            if (commentData.isPubed==0) {
                $('.pubMan').val('发布').prop('disabled', false);
            }else if(commentData.isPubed == undefined){
                $('.pubMan').hide();
            }else{
                $('.pubMan').val('已发布').prop('disabled', true);
            }
//        }catch(e) {
//
//        }

        contactModal.modal('show');
        //console.log($(this).closest('tr').attr('class'));
    })

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
                remote:{
                    url: checkMobileController, type:"post",dataType:"json",
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
        //console.log(uid);

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
        }).done(function(result) {//联系人操作

            if(!uid){
                oldContact.uid = result;
                $('#uid').val(result);
                $('.pubMan').val('发布').prop('disabled', false).show();
            }
            //console.log(JSON.stringify(oldContact));
            //console.log(activeBtn);
            var tab = activeBtn.closest('div.jsgrid');
            tab.jsGrid("search");
            activeBtn.attr('data-comment',JSON.stringify(oldContact));

            self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
        });
    }
});
@stop