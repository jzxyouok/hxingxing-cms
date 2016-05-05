@extends('layout._back')

@section('content-header')
<!-- <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid-theme.min.css" /> -->
<link type="text/css" rel="stylesheet" href="../plugins/jsgrid-1.4.1/jsgrid.min.css"/>
<link type="text/css" rel="stylesheet" href="../plugins/jsgrid-1.4.1/jsgrid-theme.min.css" />
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
                              <input type="hidden" id="activeJobIndex">
                              <input type="hidden" name="operaId" id="operaId">
                              <!--<input type="text" class="form-control" name="name" id="contactName">-->
                          </div>
                        </div>
                         <div class="form-group">
                             <label for="" class="col-md-2 control-label">搜索电话</label>
                             <div class="col-md-10"><input type="text" class="form-control" name="search" id="search"></div>
                         </div>
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">真实姓名</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="name" id="contactName">
                            </div>
                            <label for="" class="control-label pull-left">真实手机</label>
                            <div class="col-md-4">
                                 <input type="text" class="form-control" name="mobile" id="realMobile" maxlength="11">
                            </div>

<!--                          <button class="pull-left btn btn-primary pubMan">发布</button>-->
                            <input type="button" class="btn btn-primary pubMan" value="发布" isPubed="1"/>
                            <label for="realMobile" id="realMobile-error" class="row col-md-5 error"></label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-md-2 control-label">虚拟姓名</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="fakeName" id="fakeName">
                            </div>
                          <label for="" class="control-label pull-left">虚拟手机</label>
                          <div class="col-md-4">
                              <input type="text" class="form-control" name="fakeMobile" id="fakeMobile" maxlength="11">
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
                    <div class="panel panel-default">
                      <div class="panel-heading">
                          <h3 class="pull-left panel-title"><i class="icon fa fa-user"></i> 职位</h3>
                          <a class="btn btn-default pull-right" id="addJob"><i class="icon fa fa-plus"></i> 新增</a>
                          <div class="pull-right alert alert-success">操作成功！</div>
                          <div class="clearfix"></div>
                      </div>
                      

                      <form action="" class="form-horizontal panel-collapse collapse" id="jobForm">
                          <input type="hidden" name="uid" id="uid">
                          <input type="hidden" name="operaId" id="operaId">
                          <input type="hidden" name="id" id="job_id">
                        <div class="panel-body">
                            <div id="elements"></div>
                            <div class="row text-center">
                              <button type="button" class="btn btn-default" id="cancelAddJob">取消</button>
                              <input type="submit" class="btn btn-primary" id="commitOtherModal" value="保存">
                            </div>
                        </div>
                      </form>
                      <ul class="list-group"></ul>
                    </div>
                

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><!-- /.modal -->
@stop

@section('extraPlugin')
<!--引入iCheck组件-->
<script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>

<!-- jsgrid -->
<!-- <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.css" /> -->
<script src="{{ asset('plugins/jsgrid-1.4.1/jsgrid.min.js') }}" type="text/javascript"></script>

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.4.1/jsgrid.min.js"></script> -->
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
        $('#myModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
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
            if (commentData.isPubed==0 || commentData.isPubed == undefined) {
                $('.pubMan').val('发布').prop('disabled', false);
            }else{
                $('.pubMan').val('已发布').prop('disabled', true);
            }
        }catch(e) {

        }

        $('#myModal').modal('show');
    })

    $('#cancelAddJob').click(function(e) {
        $('#jobForm').collapse('hide');
    });
    // 新增职位
    $('#addJob').click(function(e) {
        var jobForm = $('#jobForm');
        jobForm[0].reset();
        $('#otherModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
        var commentData = JSON.parse(activeBtn.closest('tr').find('.openModal').attr('data-comment'));
        $('#otherModal').find('#uid').val(commentData.uid);
        jobForm.collapse('show');
    });
    // 编辑职位
    $('body').on('click','.editJob',function () {
      var jobIndex = $('#otherModal .list-group li').index($(this).closest('li'))
      var jobObj = JSON.parse(activeBtn.attr('data-comment'))
      var noCarray = ['height','age','weight'];//不带C的字段
      $('#jobForm input[type="text"],select').each(function(index, el) {
        var field = $(this).attr('name');
        $(this).val(jobObj[jobIndex][field]);
          if($.inArray(field,noCarray)>=0){
              var optionArray = $(this).find('option');
              for(var i=0;i<optionArray.length;i++){
                  if(optionArray[i].text == jobObj[jobIndex][field]) {
                      optionArray[i].selected = 'selected';
                  }
              }
         }
      });
      $('#job_id').val(jobObj[jobIndex].id)
      $('#activeJobIndex').val(jobIndex)
      $('#jobForm').collapse('show');
    })
    // 删除职位
    $('body').on('click','.deleteJob',function () {
      if (confirm('确定删除？')) {
        var self = $(this);
        var jobIndex = $(this).attr('jobid')
        $.post(jobController+'/'+jobIndex, {_method:'delete',_token:_token}, function(data, textStatus, xhr) {
              self.closest('li').remove();
            document.getElementById('jobForm').reset();
            $('#otherModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
            var commentData = JSON.parse(activeBtn.closest('tr').find('.openModal').attr('data-comment'));
            $('#otherModal').find('#uid').val(commentData.uid);
          });
      }
    })

    function jobHtml(jobData,jobIndex) {
        return '<li class="list-group-item container-fluid"><div class="col-md-11"><h4 class="list-group-item-heading">'+jobData.name+'</h4>'+jobData.role+' - '+jobData.roleDescrip+' - '+jobData.styleC+' - '+jobData.styleC+' - '+jobData.styleC+' - '+jobData.height+' - '+jobData.age+' - '+jobData.weight+' - '+jobData.salary+' - '+jobData.descrip+'<p class="list-group-item-text">'+'</p></div><div class="col-md-1"><a href="javascript:void(0);" class="editJob" jobIndex="'+jobIndex+'"><i class="fa fa-fw fa-edit"></i></a><a href="javascript:void(0);" class="deleteJob" jobIndex="'+jobIndex+'" jobId="'+jobData.id+'"><i class="fa fa-fw fa-minus-circle" title="删除"></i></a></li>';
    }
    $('body').on('click','.openOtherModal',function () {
        if($(this).closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = $(this).closest('tr.jsgrid-edit-row').next().find('.openOtherModal');
        }else{
            activeBtn = $(this);
        }

        //清空原有数据,编辑初始化
        $('#otherModal').find('input[type="text"]','input[type="hidden"]').val('');
        $('#otherModal').find('.alert').hide();
        $('#otherModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));

        //console.log(jobData);
        $('#otherModal').find('.modal-body .list-group').html('');
        $('#jobForm input[type="text"],select').val('');
        $('#jobForm').collapse('hide');
        //console.log(activeBtn.closest('tr').attr('class'));
        //console.log(activeBtn.closest('tr').find('.openModal').attr('data-comment'));
        try{
            var jobData = JSON.parse(activeBtn.attr('data-comment'));
            console.log(jobData);
            var commentHtml = '';
            for (var i = 0; i < jobData.length; i++) {
                //console.log(i);
                commentHtml += jobHtml(jobData[i],i);
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
<!--引入Chosen组件-->
<script src="{{ asset('static/js/hongka.js') }}" type="text/javascript"></script>
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
    jQuery.fn.outerHTML = function(s) {
        return s
            ? this.before(s).remove()
            : jQuery("<p>").append(this.eq(0).clone()).html();
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

              if(!personId){
                oldContact.uid = result;
                $('#myModal #uid').val(result);
              }
              console.log(JSON.stringify(oldContact));
              //console.log(activeBtn.closest('tr').attr('class'));
              activeBtn.attr('data-comment',JSON.stringify(oldContact));

              self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
          });
        }
    });

    var jobForm = $('#jobForm');
    var validator= jobForm.validate({
        onkeyup:false,
        focusInvalid:false,
        submitHandler: function(form) {
            var self = $('#commitOtherModal');
            
            var item = jobForm.serialize();            
            var oldContact= jobForm.serializeObject();

            <!-- 提交数据带上下拉选中项的文本 -->
            jobForm.find('select').each(function(index, el) {
              var self = $(this);
              var originFields = ['height','age','weight'];
              var thisName = self.attr('name');
              var thisTxt = self.find("option:selected").text();
              if($.inArray(thisName,originFields)>=0){
                oldContact[thisName] = thisTxt
                item += '&'+thisName+'='+thisTxt
              }else {
                <!-- 下拉文本字段 -->
                var txtField = thisName.replace(/C/g, '');
                oldContact[txtField] = thisTxt
                item += '&'+txtField+'='+thisTxt
              }
            });

            item._token=_token;

            var personId = $("#jobForm #job_id").val();
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

                var jobBox = $('#otherModal ul.list-group')
                if(!personId) {
                    oldContact.id = result;
                    var dataComment = JSON.parse(activeBtn.attr('data-comment'));

                    //dataComment.push(oldContact);
                    dataComment.splice(0, 0, oldContact);
                    activeBtn.attr('data-comment',JSON.stringify(dataComment));
                    console.log(activeBtn.attr('data-comment'));
                    console.log(jobBox.html());
                    jobBox.prepend(jobHtml(oldContact,jobBox.find('li').length));
                }else{
                    <!-- 编辑，更新职位按钮弹窗职位数据 -->
                    var jobObj = JSON.parse(activeBtn.attr('data-comment'));
                    var activeJobIndex = $('#activeJobIndex').val();
                    jobObj[activeJobIndex] = oldContact;
                    activeBtn.attr('data-comment',JSON.stringify(jobObj));
                    console.log(oldContact,/*jobHtml(oldContact,activeJobIndex),*/activeJobIndex)
                    jobBox.find('li').eq(activeJobIndex).outerHTML(jobHtml(oldContact,activeJobIndex))
                    $('#jobForm').collapse('hide');
                }
                //console.log(JSON.stringify(oldContact));
                //console.log(activeBtn.closest('tr').attr('class'));
                //activeBtn.attr('data-comment',JSON.stringify(oldContact));

                //self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
            });
        }
    });
@stop