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
  td a.btn-sm:not(.checkbox-toggle){text-overflow: ellipsis;overflow: hidden;width: 50px;padding: 5px;}
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

  <!-- contact（Modal） -->
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
                <span class="pull-left"><i class="icon fa fa-user"></i> 联系人</span>
                <span class="modalTitle"></span>
              </h4>
           </div>
          <form action="" class="form-horizontal" id="contactForm" onkeydown="if(event.keyCode==13)return false;">
            <div class="modal-body">
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
                     <!-- <div class="form-group">
                         <label for="" class="col-md-2 control-label">搜索电话</label>
                         <div class="col-md-10"><input type="text" class="form-control" name="search" id="search"></div>
                     </div> -->
                    <div class="form-group">
                        <label for="" class="col-md-2 control-label">真实姓名</label>
                        <div class="col-md-3">
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
            <div class="modal-footer">
              <div class="pull-right alert alert-success">操作成功！</div>
              <button type="submit" class="btn btn-primary" id="commitContact">提交更改</button>
            </div>
          </form>
        </div><!-- /.modal-content -->
  </div><!-- /.modal -->
  </div><!-- /.modal -->

  <!-- jobs（Modal） -->
  <div class="modal fade" id="jobsModal" tabindex="-1" role="dialog"
       aria-labelledby="jobsModalLabel" aria-hidden="true">
      <div class="modal-dialog" style="width: 800px;">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title text-center row" id="jobsModalLabel">
                      <span class="pull-left"><i class="icon fa fa-th-large"></i> 职位</span>&nbsp;
                      <a class="btn btn-info btn-sm pull-left" id="addJob"><i class="icon fa fa-plus"></i> 新增</a>
                      <span class="modalTitle"></span>
                  </h4>
              </div>

              <div class="modal-body">
                  <form action="" class="form-horizontal panel-collapse collapse" id="jobForm">
                  <input type="hidden" name="uid" id="uid">
                  <input type="hidden" name="operaId" id="operaId">
                  <input type="hidden" name="id" id="job_id">
                  <div id="elements"></div>
                  <div class="form-group text-center">
                    <button type="button" class="btn btn-default" id="cancelAddJob">取消</button>
                    <input type="submit" class="btn btn-primary" id="commitjob" value="保存">
                  </div>
                  </form>

                  <ul class="list-group" id="jobsBox" style="max-height: 300px;overflow-y: scroll;"></ul>
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
<script src="{{ asset('static/js/jquery.form.js') }}" type="text/javascript"></script>
<script src="{{ asset('static/js/jquery.validate.js') }}" type="text/javascript"></script>
<script>
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
    $.fn.outerHTML = function(s) {
        return s
            ? this.before(s).remove()
            : jQuery("<p>").append(this.eq(0).clone()).html();
    };

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var operaController = '{{ route("admin.opera.index") }}';
    var uploadController = '{{ route("admin.upload") }}';
    var personController = '{{ route("admin.person.index") }}';
    var checkMobileController = '{{ route("admin.person.index") }}/checkMobile';
    var searchMobileController = '{{ route("admin.person.index") }}/searchMobile';
    var jobController = '{{ route("admin.jobs.index") }}';
    var manageRole = '{{$manageRole}}';
    var _token = '{{ csrf_token() }}';
    var serverUrl = '{{ $serverUrl }}';
    var activeBtn;

    $('body').on('submit','.operaCoverForm',function (e) {
      e.preventDefault();
      var self = $(this)
      var formData = new FormData();
      formData.append('picture', self.find('.operaCoverInput')[0].files[0]);
      $.ajax({
          type: 'POST',
          url: uploadController,
          data: formData,
          contentType: false,
          processData: false,
      }).done(function(data) {
          // console.log(data)
          self.find('.operaCoverFile').attr('src',serverUrl+data.info)
          self.find('.operaCoverBox').val(data.info)
      })
    })

    $('body').on('click','.openContact',function () {
        var self = $(this);
        var contactModal = $('#contactModal');
        if(self.closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = self.closest('tr.jsgrid-edit-row').next().find('.openContact');
        }else{
            activeBtn = self;
        }

        //清空原有数据,编辑初始化
        $('#contactForm').find('input[type="text"]','input[type="hidden"]').val('');
        contactModal.find('.alert').hide();
        //console.log(activeBtn.closest('tr').find('input[type="checkbox"]').attr('data-id'));
        contactModal.find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
//        try{
            // console.log(activeBtn.attr('data-comment'));
            var commentData = JSON.parse(activeBtn.attr('data-comment'));
            // console.log(commentData);
            var artTitle = self.data('title');//s
            contactModal.find('.modalTitle').text(artTitle);
            $('#contactModal #uid').val(commentData.uid);
            $('#isPubed').val(commentData.isPubed);
            $('#contactName').val(commentData.name);
            $('#realMobile').val(commentData.realMobile);
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
            }else if(commentData.isPubed == undefined){
                $('.pubMan').hide();
            }else{
                $('.pubMan').val('已发布').prop('disabled', true);
            }
//        }catch(e) {
//
//        }
        contactModal.modal('show');
    })

    $('#cancelAddJob').click(function(e) {
        $('#jobForm').collapse('hide');
    });
    // 新增职位
    $('#addJob').click(function(e) {
        var jobForm = $('#jobForm');
        jobForm[0].reset();
        jobForm.find('#job_id').val(0)
        /*$('#jobsModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
        var commentData = JSON.parse(activeBtn.closest('tr').find('.openContact').attr('data-comment'));
        $('#jobsModal').find('#uid').val(commentData.uid);*/
        jobForm.collapse('show');
    });
    // 编辑职位
    $('body').on('click','.editJob',function () {
      var jobIndex = $('#jobsModal .list-group li').index($(this).closest('li'))
      var jobObj = JSON.parse(activeBtn.attr('data-comment'))
      var noCarray = ['height','age','weight'];//不带C的字段
      $('#jobForm input[type="text"],select,textarea').each(function(index, el) {
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
        var operaId = $(this).attr('operaId')
        $.post(jobController+'/'+jobIndex, {_method:'delete',_token:_token,operaId:operaId}, function(data, textStatus, xhr) {
            data = JSON.parse(data)
            // console.log(data)
            if (data.status=='ok') {
                self.closest('li').remove();
                document.getElementById('jobForm').reset();
                $('#jobsModal').find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));
                var commentData = JSON.parse(activeBtn.closest('tr').find('.openContact').attr('data-comment'));
                $('#jobsModal').find('#uid').val(commentData.uid);
                var newJobsNum = parseInt(activeBtn.text()) -1;
                $('.jsgrid-edit-row').find('.openJobs').text(newJobsNum);
                activeBtn.text(newJobsNum);
            }else {
                alert(data.msg)
            }
          });
      }
    })

    function jobHtml(jobData,jobIndex) {
        return '<li class="list-group-item container-fluid"><div class="col-md-11"><h4 class="list-group-item-heading">'+jobData.name+' - '+jobData.role+'</h4> - '+jobData.roleDescrip+' - '+jobData.style1+' - '+jobData.style2+' - '+jobData.style3+' - '+jobData.height+'cm - '+jobData.age+'岁 - '+jobData.weight+' - '+jobData.salary+' - '+jobData.descrip+'<p class="list-group-item-text">'+'</p></div><div class="pull-right"><a href="javascript:void(0);" class="editJob" jobIndex="'+jobIndex+'"><i class="fa fa-fw fa-edit"></i></a>&nbsp;<a href="javascript:void(0);" class="deleteJob" jobIndex="'+jobIndex+'" jobId="'+jobData.id+'" operaId="'+jobData.operaId+'"><i class="fa fa-fw fa-minus-circle" title="删除"></i></a></li>';
    }
    $('body').on('click','.openJobs',function () {
        var self = $(this);
        var jobsModal = $('#jobsModal');
        if(self.closest('tr').hasClass('jsgrid-edit-row')){
            activeBtn = self.closest('tr.jsgrid-edit-row').next().find('.openJobs');
        }else{
            activeBtn = self;
        }

        //清空原有数据,编辑初始化
        jobsModal.find('input[type="text"]','input[type="hidden"]').val('');
        jobsModal.find('.alert').hide();
        jobsModal.find('#operaId').val(activeBtn.closest('tr').find('.tabOperaId').attr('data-id'));

        //console.log(jobData);
        jobsModal.find('#jobsBox').html('');
        $('#jobForm input[type="text"],select').val('');
        $('#jobForm').collapse('hide');
        //console.log(activeBtn.closest('tr').attr('class'));
        //console.log(activeBtn.closest('tr').find('.openContact').attr('data-comment'));

        var commentHtml = '';
        // try{
            var artTitle = self.data('title');//s
            jobsModal.find('.modalTitle').text(artTitle);

            var commentData = JSON.parse(activeBtn.closest('tr').find('.openContact').attr('data-comment'));
            jobsModal.find('#uid').val(commentData.uid);

            var jobData = JSON.parse(activeBtn.attr('data-comment'));
            console.log(jobData)
            if(!commentData.uid>0 && !jobData.length){
              alert('请添加联系人后操作');
              return false;
            }
            if(!jobData.length){
              $('#jobForm').collapse('show');
            }
            // console.log(jobData);
            for (var i = 0; i < jobData.length; i++) {
                //console.log(i);
                commentHtml += jobHtml(jobData[i],i);
            }
        /*}catch(e) {

        }*/
        jobsModal.find('#jobsBox').html(commentHtml);
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
@stop

@section('filledScript')
    var contactForm = $('#contactForm');
    var validator= contactForm.validate({
      onkeyup:false,
        focusInvalid:false,
        rules:{
          contactName:{required:true},
          mobile: {required:true,
            remote:{url: checkMobileController, type:"post",dataType:"json",
              data: {uid: function(){return $("#contactForm #uid").val();},mobile: function(){return $("#contactForm #realMobile").val();}}
            }
          },
        },
        messages:{
          contactName:{required:'必填项'},
          mobile:{required:'请输入手机号',remote:'已经存在'},
        },
        submitHandler: function(form) {
          var self = $('#commitContact');

          var item = contactForm.serialize();
          var oldContact= contactForm.serializeObject();

          item._token=_token;

        var personId = $("#contactForm #uid").val();
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
                  self.prev().text('操作失败').removeClass('alert-success').addClass('alert-warning').show();
              },
              complete: function( xhr ) {
                  self.prop('disabled', false);
              },
          }).done(function(result) {//联系人操作

              if(!personId){
                oldContact.uid = result;
                $('#contactModal #uid').val(result);
                $('.pubMan').val('发布').prop('disabled', false).show();
              }
                var tab = activeBtn.closest('div.jsgrid');
                tab.jsGrid("search");

              console.log(JSON.stringify(oldContact));
              //console.log(activeBtn.closest('tr').attr('class'));
              activeBtn.attr('data-comment',JSON.stringify(oldContact));

              self.prev().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
          });
        }
    });

    var jobForm = $('#jobForm');
    var validator= jobForm.validate({
        onkeyup:false,
        focusInvalid:false,
        rules:{
          nameC:{required:true},
          mobile: {required:true,
            remote:{url: checkMobileController, type:"post",dataType:"json",
              data: {uid: function(){return $("#contactForm #uid").val();},mobile: function(){return $("#contactForm #realMobile").val();}}
            }
          },
        },
        messages:{
          nameC:{required:'必选项'},
        },
        submitHandler: function(form) {
            var self = $('#jobsModal');

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

            var activeJobId = $("#jobForm #job_id").val();
            if (activeJobId>0) {
                var method = 'PUT';
                var url = jobController+'/'+activeJobId;
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

                var jobBox = $('#jobsBox')
                if(activeJobId>0) {
                    <!-- 编辑，更新职位按钮弹窗职位数据 -->
                    var jobObj = JSON.parse(activeBtn.attr('data-comment'));
                    var activeJobIndex = $('#activeJobIndex').val();
                    jobObj[activeJobIndex] = oldContact;
                    activeBtn.attr('data-comment',JSON.stringify(jobObj));
                    <!-- console.log(oldContact,/*jobHtml(oldContact,activeJobIndex),*/activeJobIndex) -->
                    jobBox.find('li').eq(activeJobIndex).outerHTML(jobHtml(oldContact,activeJobIndex))
                }else{
                    oldContact.id = result;
                    var dataComment = JSON.parse(activeBtn.attr('data-comment'));

                    //dataComment.push(oldContact);
                    dataComment.splice(0, 0, oldContact);
                    activeBtn.attr('data-comment',JSON.stringify(dataComment));
                    <!-- console.log(activeBtn.attr('data-comment')); -->
                    <!-- console.log(jobBox.html()); -->
                    jobBox.prepend(jobHtml(oldContact,jobBox.find('li').length));

                    var oldTxt = activeBtn.text();
                    var newJobsNum = parseInt($.isNumeric(oldTxt)?oldTxt:0) +1;
                    $('.jsgrid-edit-row').find('.openJobs').text(newJobsNum);
                    activeBtn.text(newJobsNum);
                }
                $('#jobForm').collapse('hide');
                //console.log(JSON.stringify(oldContact));
                //console.log(activeBtn.closest('tr').attr('class'));
                //activeBtn.attr('data-comment',JSON.stringify(oldContact));

                //self.next().text('操作成功').removeClass('alert-warning').addClass('alert-success').show();
            });
        }
    });
@stop