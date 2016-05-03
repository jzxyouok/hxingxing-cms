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
               <span id="modalTitle"></span>
            </h4>
         </div>
         <div class="modal-body">
            <form action="" class="form-horizontal" id="modalForm" onkeydown="if(event.keyCode==13)return false;">
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
                          <!--<label for="" class="col-md-2 control-label">姓名</label>-->
                          <div class="col-md-10" id="hidden">
                              <input type="hidden" name="uid" id="uid">

                              <input type="hidden" name="operaId" id="operaId">
                              <!--<input type="text" class="form-control" name="name" id="contactName">-->
                          </div>
                        </div>
                         <div class="form-group">
                             <label for="" class="col-md-2 control-label">搜索电话</label>
                             <div class="col-md-10"><input type="text" class="form-control" name="search" id="search"></div>
                         </div>
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">发布真实姓名</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="name" id="contactName">
                            </div>
                            <label for="" class="col-md-2 control-label">真实手机</label>
                            <div class="col-md-3">
                                 <input type="text" class="form-control" name="mobile" id="realMobile">
                            </div>

<!--                          <button class="pull-left btn btn-primary pubMan">发布</button>-->
                            <input type="button" class="btn btn-primary pubMan" value="发布" isPubed="1"/>
                            <label for="realMobile" id="realMobile-error" class="row col-md-5 error"></label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">发布虚拟姓名</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="fakeName" id="fakeName">
                            </div>
                          <label for="" class="col-md-2 control-label">虚拟手机</label>
                          <div class="col-md-3">
                              <input type="text" class="form-control" name="fakeMobile" id="fakeMobile">
                          </div>
<!--                          <button class="pull-left btn btn-primary pubMan">发布</button>-->
                            <input type="button" class="btn btn-primary pubMan" value="发布" isPubed="2"/>

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
                             <div class="col-md-10"><input type="text" class="form-control" name="remark" id="remark"></div>
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


<!-- 另一个弹框 模态框（Modal） -->
<div class="modal fade" id="otherModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center row" id="myModalLabel">
                    <span id="modalTitle"></span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal" id="modalOtherForm">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                          <h3 class="pull-left panel-title"><i class="icon fa fa-user"></i> 职位</h3>
                          <a class="btn btn-default pull-right" data-toggle="collapse" href="#jobForm"><i class="icon fa fa-chevron-down"></i> 新增</a>
                          <div class="pull-right alert alert-success">操作成功！</div>
                          <div class="clearfix"></div>
                      </div>
                      
                      <div id="jobForm" class="panel-collapse collapse">
                        <div class="panel-body">
                            <input type="hidden" name="uid" id="uid">
                            <input type="hidden" name="operaId" id="operaId">
                            <div class="form-group">
                                <label class="col-md-3 control-label">职位名 <small class="text-red">*</small></label>
                                <div class="col-md-5">
                                    <input type="text" class="form-control" name="name" id="job" autocomplete="off" value="" placeholder="职位名">
                                    <input type="hidden" name="id" value="" id="job_id">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">薪资 <small class="text-red">*</small></label>
                                <div class="col-md-5"><input type="text" class="form-control" name="salary" id="salary" autocomplete="off" value="" placeholder=""></div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">说明 <small class="text-red">*</small></label>
                                <div class="col-md-5"><input type="text" class="form-control" name="descrip" id="descrip" autocomplete="off" value="" placeholder=""></div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">角色名 <small class="text-red">*</small></label>
                                <div class="col-md-5"><input type="text" class="form-control" name="role" id="role" autocomplete="off" value="" placeholder=""></div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">角色说明 <small class="text-red">*</small></label>
                                <div class="col-md-5"><input type="text" class="form-control" name="roleDescrip" id="roleDescrip" autocomplete="off" value="" placeholder=""></div>
                            </div>
                            <div class="row text-center">
                              <input type="submit" class="btn btn-primary" id="commitOtherModal" value="提交更改">
                            </div>
                        </div>
                      </div>
                      <ul class="list-group"></ul>
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
  var operaController = '{{ route("admin.opera.index") }}';
  var personController = '{{ route("admin.person.index") }}';
  var checkMobileController = '{{ route("admin.person.index") }}/checkMobile';
  var searchMobileController = '{{ route("admin.person.index") }}/searchMobile';
  var jobController = '{{ route("admin.jobs.index") }}';
  var manageRole = '{{$manageRole}}';
  var _token = '{{ csrf_token() }}';
  var activeBtn;

    $('body').on('click','.openModal',function () {
        console.log($(this).closest('tr').attr('class'));
        if($(this).closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = $(this).closest('tr.jsgrid-edit-row').next().find('.openModal');
        }else{
            activeBtn = $(this);
        }

        //console.log(activeBtn.attr('data-comment'));
        //清空原有数据,编辑初始化
        $('#modalForm').find('input[type="text"]','input[type="hidden"]').val('');
        $('#myModal').find('.alert').hide();
        //console.log(activeBtn.closest('tr').find('input[type="checkbox"]').attr('data-id'));
        $('#myModal').find('#operaId').val(activeBtn.closest('tr').find('input[type="checkbox"]').attr('data-id'));
        try{
            console.log(activeBtn.attr('data-comment'));
            var commentData = JSON.parse(activeBtn.attr('data-comment'));
            console.log(commentData);
            var artTitle = $(this).data('title');//s
            $('#modalTitle').text(artTitle);
            $('#myModal #uid').val(commentData.uid);
            console.log($('#uid'));
            $('#isPubed').val(commentData.isPubed);
            $('#contactName').val(commentData.name);
            $('#realMobile').val(commentData.mobile);
            $('#fakeName').val(commentData.fakeName);
            $('#fakeMobile').val(commentData.fakeMobile);
            $('#contactCompany').val(commentData.company);
            $('#contactPosition').val(commentData.position);
            $('#otherName').val(commentData.otherName);
            $('#otherMobile').val(commentData.otherMobile);
            $('#otherCompany').val(commentData.otherCompany);
            $('#remark').val(commentData.remark);
            if (commentData.isPubed==0) {
                $('.pubMan').val('发布').prop('disabled', false);
            }else{
                $('.pubMan').val('已发布').prop('disabled', true);
            }
        }catch(e) {

        }

        $('#myModal').modal('show');
    })

    $('body').on('click','.openOtherModal',function () {
//      var closestTr = $(this).closest('tr');
//        if(closestTr.hasClass('jsgrid-edit-row')){
//            activeBtn = closestTr.next().find('.openOtherModal');
//        }else{
//            activeBtn = $(this);
//        }
        //console.log($(this).closest('tr').attr('class'));
        if($(this).closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = $(this).closest('tr.jsgrid-edit-row').next().find('.openOtherModal');
        }else{
            activeBtn = $(this);
        }

        //清空原有数据,编辑初始化
        $('#otherModal').find('input[type="text"]','input[type="hidden"]').val('');
        $('#otherModal').find('.alert').hide();
        $('#otherModal').find('#operaId').val(activeBtn.closest('tr').find('input[type="checkbox"]').attr('data-id'));

        //console.log(jobData);
        $('#otherModal').find('.modal-body .list-group').html('');
        //console.log(activeBtn.closest('tr').attr('class'));
        //console.log(activeBtn.closest('tr').find('.openModal').attr('data-comment'));
        try{
            var jobData = JSON.parse(activeBtn.attr('data-comment'));
            console.log(jobData);
            var commentHtml = '';
            for (var i = 0; i < jobData.length; i++) {
                //console.log(i);
                commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-11"><h4 class="list-group-item-heading">'+jobData[i].name+'</h4>'+jobData[i].salary+' - '+jobData[i].descrip+' - '+jobData[i].role+'<p class="list-group-item-text">'+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="" data-id="'+jobData[i].id+'"></i></a></li>';
            }
            var commentData = JSON.parse(activeBtn.closest('tr').find('.openModal').attr('data-comment'));
            //console.log(commentData);
            $('#otherModal').find('#uid').val(commentData.uid);



            //console.log(commentHtml);
            /*$('#otherModal').find('#uid').val(jobData.uid);
            $('#job_id').val(jobData.id);
            $('#job').val(jobData.name);//job_id
            $('#salary').val(jobData.salary);
            $('#descrip').val(jobData.descrip);
            $('#role').val(jobData.role);
            $('#roleDescrip').val(jobData.roleDescrip);*/
        }catch(e) {

        }
        $('#otherModal').find('.modal-body .list-group').html(commentHtml!=''?commentHtml:'没有职位');
        //$('#otherModal').modal('show');
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
<script src="{{ asset('plugins/jsgrid-1.4.1/business.js') }}" type="text/javascript"></script>
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

          item._token=_token;

        var personId = $("#modalForm #uid").val();
            console.log(personId);
          if (personId>0) {
              var method = 'PUT';
              var url = personController+'/'+personId;
          }else{
              var method = 'post';
              var url = personController;
          }
            console.log(url);
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

              if(!personId)  oldContact.uid = result;
              console.log(JSON.stringify(oldContact));
              //console.log(activeBtn.closest('tr').attr('class'));
              activeBtn.attr('data-comment',JSON.stringify(oldContact));

              self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
          });
        }
    });

    var modalOtherForm = $('#modalOtherForm');
    var validator= modalOtherForm.validate({
        onkeyup:false,
        focusInvalid:false,
        submitHandler: function(form) {
            console.log('123');
            var self = $('#commitOtherModal');

            var item = modalOtherForm.serialize();
            //console.log(item);
            var oldContact= modalOtherForm.serializeObject();

            item._token=_token;

            var personId = $("#modalOtherForm #job_id").val();
            //console.log(personId);
            if (personId>0) {
                var method = 'PUT';
                var url = jobController+'/'+personId;
            }else{
                var method = 'post';
                var url = jobController;
            }
            //console.log(url);
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

                if(!personId) {
                    oldContact.id = result;
                    var dataComment = JSON.parse(activeBtn.attr('data-comment'));

                    dataComment.push(oldContact);
                    activeBtn.attr('data-comment',JSON.stringify(dataComment));
                    console.log(activeBtn.attr('data-comment'));
                    console.log($('#modalOtherForm ul.list-group').html());
                    $('#modalOtherForm ul.list-group').append(
'<li class="list-group-item container-fluid"><div class="col-md-11"><h4 class="list-group-item-heading">'+oldContact.name+'</h4>'+oldContact.salary+' - '+oldContact.descrip+' - '+oldContact.role+'<p class="list-group-item-text">'+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="" data-id="' + oldContact.id + '"></i></a></li>'
);
                }else{

                }
                //console.log(JSON.stringify(oldContact));
                //console.log(activeBtn.closest('tr').attr('class'));
                //activeBtn.attr('data-comment',JSON.stringify(oldContact));

                //self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
            });
        }
    });
@stop