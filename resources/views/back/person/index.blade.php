@extends('layout._back')

@section('content-header')
<style>
    .panel-heading h3 {padding-top: 8px;}
    .panel-heading{padding: 5px 15px}
    .modal .label{padding: 10px;display: none}
</style>
@parent
  
@stop

@section('content')

              @if(Session::has('message'))
                <div class="alert alert-success alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4>  <i class="icon fa fa-check"></i> 提示！</h4>
                  {{ Session::get('message') }}
                </div>
              @endif

              <!-- <a href="{{ route('admin.person.create') }}" class="btn btn-primary margin-bottom">新增管理员</a> -->
          
          <div class="nav-tabs-custom">
            <nav class="navbar" style="margin-bottom: 0">
              <ul id="mainTab" class="nav nav-tabs navbar-nav">
                <li @if($tab == 0)class="active"@endif><a href="#tab_1" data-toggle="tab" aria-expanded="true">未发布</a></li>
                <li @if($tab == 1)class="active"@endif><a href="#tab_2" data-toggle="tab" aria-expanded="false">已发布</a></li>
              </ul>
              <form action="{{ route('admin.person.index') }}?tab={{$tab}}" method="get" class="navbar-form navbar-right">
                <div class="input-group">
                  <input type="text" class="form-control input-sm pull-right" name="s_name" value="{{ Input::get('s_name') }}" style="width: 150px;" placeholder="搜索用户名">
                  <input type="text" class="form-control input-sm pull-right" name="s_phone" value="{{ Input::get('s_phone') }}" style="width: 150px;" placeholder="搜索手机号">
                  <div class="input-group-btn">
                    <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </form>
            </nav>
          <div class="tab-content">
                  
              <div @if($tab == 0)class="tab-pane active"@else class="tab-pane"@endif id="tab_1">
                <div class="box-body table-responsive">
                  <table class="table table-hover table-bordered">
                    <tbody>
                      <!--tr-th start-->
                      <tr>
                        <th></th>
                        <th>手机号</th>
                        <th>用户名</th>
                        <th>性别</th>
                        <th>毕业学院</th>
                        <th>年龄</th>
                        <th>身高</th>
                        <th>体重</th>
                        <th>公司/剧组</th>
                        <th>职务</th>
                        <th>头像</th>
                        <th>代表作品</th>
                        <th><i class="fa fa-heart"></i> 收藏</th>
                        <th><i class="fa fa-eye"></i> 查看</th>
                        <th>状态</th>
                        <th>注册时间</th>
                      </tr>
                      <!--tr-th end-->
                      @foreach ($unpub as $user)
                      <tr>
                        <td>
                          <button class="btn btn-default btn-sm openPush" data-uid="{{ $user->uid }}" data-mobile="{{ $user->mobile }}" data-fakeMobile="{{ $user->fakeMobile }}" data-title="{{ $user->name }}" data-toggle="modal" data-target="#pushModal"><i class="fa fa-fw fa-send"></i></button>
                        </td>
                        <td>{{ $user->mobile }}</td>
                        <td class="text-muted">{{ $user->name }}</td>
                        <td class="text-muted">{{ $user->sex }}</td>
                        <td class="text-muted">{{ $user->graduate }}</td>
                        <td class="text-muted">{{ $user->age }}</td>
                        <td class="text-muted">{{ $user->height }}</td>
                        <td class="text-muted">{{ $user->weight }}</td>
                        <td class="text-muted">{{ $user->company }}</td>
                        <td class="text-muted">{{ $user->position }}</td>
                        <td>
                          @if($user->avatar)
                            <img src="{{$serverUrl}}/{{ $user->avatar }}" style="height: 35px;width: 35px">
                            @endif
                        </td>
                        <td class="text-muted">
                            @if( count($user->works) > 1)
                                <a href="javascript:void(0)" data-title="{{ $user->name }}" data-works="{{ $user->works }}" class="openWorks" data-toggle="modal" data-target="#worksModal"><i class="fa fa-file-video-o"></i></a>
                            @endif
                        </td>
                        <td class="text-muted">{{ $user->likeNum }}</td>
                        <td class="text-muted">{{ $user->viewNum }}</td>
                        <td class="text-muted">{{ $user->status }}</td>
                        <td>{{ str_limit($user->created_at, 16,'') }}</td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  {!! $unpub->appends(['tab'=>0])->render() !!}
                </div>
              </div>
          
              <div @if($tab == 1)class="tab-pane active"@else class="tab-pane"@endif id="tab_2">
                <div class="box-body table-responsive">
                  <table class="table table-hover table-bordered">
                    <tbody>
                      <!--tr-th start-->
                      <tr>
                        <th></th>
                        <th>手机号</th>
                        <th>用户名</th>
                        <th>性别</th>
                        <th>毕业学院</th>
                        <th>年龄</th>
                        <th>身高</th>
                        <th>体重</th>
                        <th>公司/剧组</th>
                        <th>职务</th>
                        <th>头像</th>
                        <th>代表作品</th>
                        <th><i class="fa fa-heart"></i> 收藏</th>
                        <th><i class="fa fa-eye"></i> 查看</th>
                        <th>状态</th>
                        <th>注册时间</th>
                      </tr>
                      <!--tr-th end-->
                      @foreach ($pubed as $user)
                      <tr>
                        <td>
                          <button class="btn btn-default btn-sm openPush" data-uid="{{ $user->uid }}" data-mobile="{{ $user->mobile }}" data-fakeMobile="{{ $user->fakeMobile }}" data-title="{{ $user->name }}" data-toggle="modal" data-target="#pushModal"><i class="fa fa-fw fa-send"></i></button>  
                        </td>
                        <td>{{ $user->mobile }}</td>
                        <td class="text-muted">{{ $user->name }}</td>
                        <td class="text-muted">{{ $user->sex }}</td>
                        <td class="text-muted">{{ $user->graduate }}</td>
                        <td class="text-muted">{{ $user->age }}</td>
                        <td class="text-muted">{{ $user->height }}</td>
                        <td class="text-muted">{{ $user->weight }}</td>
                        <td class="text-muted">{{ $user->company }}</td>
                        <td class="text-muted">{{ $user->position }}</td>
                        <td>
                          @if($user->avatar)
                            <img src="{{$serverUrl}}/{{ $user->avatar }}" style="height: 35px;width: 35px">
                            @endif
                        </td>
                        <td class="text-muted">
                            @if( count($user->works) > 1)
                                <a href="javascript:void(0)" data-title="{{ $user->name }}" data-works="{{ $user->works }}" class="openWorks" data-toggle="modal" data-target="#worksModal"><i class="fa fa-file-video-o"></i></a>
                            @endif
                        </td>
                        <td class="text-muted">{{ $user->likeNum }}</td>
                        <td class="text-muted">{{ $user->viewNum }}</td>
                        <td class="text-muted">{{ $user->status }}</td>
                        <td>{{ str_limit($user->created_at, 16,'') }}</td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  {!! $pubed->appends(['tab'=>1])->render() !!}
                </div>
              </div>
              <form method="post" action="{{ route('admin.person.index') }}" accept-charset="utf-8" id="hidden-delete-form">
                    <input name="_method" type="hidden" value="delete">
<!--                    <input type="hidden" name="_token" value="{{ csrf_token() }}">-->
                </form>
          </div>
      </div>

  <div class="modal fade" id="pushModal" tabindex="-1" role="dialog" aria-labelledby="chatHistoryModalLabel" aria-hidden="true">
     <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">
              <button type="button" class="close" 
                 data-dismiss="modal" aria-hidden="true">
                    &times;
              </button>
              <h4 class="modal-title text-center row" id="myModalLabel">
                <span class="pull-left">推送</span><span class="modalTitle"></span>
              </h4>
           </div>
           <div class="modal-body">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <label class="checkbox-inline">
                    <input type="radio" name="pushType" value="sms" checked> 短信
                  </label>
                  <label class="checkbox-inline">
                    <input type="radio" name="pushType" value="hx">App消息
                  </label>
                  <button type="button" class="pull-right btn btn-primary" id="pushBtn">
                     <i class="icon fa fa-send"></i> 发送
                  </button>
                  <span class="pull-right label label-success">已发送！</span>
                  <div class="clearfix"></div>
                </div>
                <div class="panel-body">
                  <form action="" class="form-horizontal" id="pushForm">
                        <div class="form-group">
                          <label for="" class="col-md-2 control-label">选择手机</label>
                          <div class="col-md-10">
                          <input type="hidden" id="uid">
                          <div>
                            <label class="checkbox-inline">
                              <input type="radio" name="mobileFinal" value="real" checked> 真实手机
                            </label>
                            <label class="checkbox-inline" id="realMobile"></label>
                          </div>
                          <div>
                            <label class="checkbox-inline">
                              <input type="radio" name="mobileFinal" value="fake">虚拟手机
                            </label>
                            <label class="checkbox-inline" id="fakeMobile"></label>
                          </div>
                          </div>
                        </div>
                        <div class="row">
                          <label for="" class="col-md-2 control-label">内容</label>
                          <div class="col-md-10">
                            <select class="form-control" id="msgTpl">
                               <option value="">请选择模板</option>
                               <option value="欢迎体验【红猩猩】，在这里可以找到它">欢迎体验【红猩猩】，在这里可以找到它</option>
                               <option value="欢迎使用【红猩猩】APP，这是个影视人才资源平台。您的账号是：XXX（读取的真实手机号），密码是：123456,。请尽快登录修改密码。">欢迎使用【红猩猩】APP，这是个影视人才资源平台。您的账号是：XXX（读取的真实手机号），密码是：123456,。请尽快登录修改密码。</option>
                               <option value="欢迎使用【红猩猩】APP，这是个影视人才资源平台。您的账号是：XXX（读取的虚拟手机号），密码是：123456,。请尽快登录，绑定为您自己的手机号，并修改密码。">欢迎使用【红猩猩】APP，这是个影视人才资源平台。您的账号是：XXX（读取的虚拟手机号），密码是：123456,。请尽快登录，绑定为您自己的手机号，并修改密码。</option>
                               <option value="嘿！你知道吗？又有一批新的剧组和演职人员在红猩猩里面沟通了，去看看嘛。">嘿！你知道吗？又有一批新的剧组和演职人员在红猩猩里面沟通了，去看看嘛。</option>
                               <option value="达令，你好久没来看人家了。">达令，你好久没来看人家了。</option>
                               <option value="你真的真的，不要人家了吗？T-T 
">你真的真的，不要人家了吗？T-T 
</option>
                            </select>
                            <textarea class="form-control" rows="2" placeholder="嗨" id="msgInput">【红色咖啡】大人，周星驰发布了女主（求职意向岗位）微简历，他（她）是你的艺中人吗？</textarea>
                          </div>
                        </div>
                      </form>
                </div>
              </div>

              <div class="panel panel-default" style="margin-bottom: 0;">
                <div class="panel-heading">与我(管理员) 的App消息记录</div>
                <div class="panel-body">
                  <ul class="list-group" id="hxHistory" style="height: 250px;overflow-y: scroll;margin-bottom: 0;"></ul>
                </div>
              </div>
           </div>
        </div><!-- /.modal-content -->
  </div><!-- /.modal -->
  </div>

  <div class="modal fade" id="worksModal" tabindex="-1" role="dialog" aria-labelledby="chatHistoryModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title text-center row" id="myModalLabel">
              <span class="pull-left"><i class="icon fa fa-file"></i> 代表作品</span><span class="modalTitle"></span>
            </h4>
         </div>
         <div class="modal-body" id="commentBox">
            <ul class="list-group" ></ul>
         </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal -->
  </div>
@stop

@section('filledScript')
    var operaController = '{{ route("admin.opera.index") }}';
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var token = '{{ csrf_token() }}';
    var rowIndex;
    
    $('#msgTpl').change(function () {
      $('#msgInput').val('')
    })
    $('.openPush').click(function () {
      rowIndex = $('table tr').index($(this).closest('tr'));
      var uid = $(this).data('uid');
      var mobile = $(this).data('mobile');
      var fakeMobile = $(this).data('fakeMobile');
      var title = $(this).data('title');

      $('#pushModal').find('.modalTitle').html(title).end().find('#uid').val(uid).end().find('#realMobile').text(mobile).end().find('#fakeMobile').text(fakeMobile);
    })

    $('#pushBtn').click(function(event) {
        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var mobileFinal = $('input[name="mobileFinal"]:checked').val();
        mobile = $('#'+mobileFinal+'Mobile');
        pushType = $('input[name="pushType"]:checked').val();
        if(!myreg.test(mobile.text()) && pushType=='sms') {
            alert('手机号码无效！'); 
            return false; 
        }
        
        var self = $(this);
        var msgBox = self.next();
        if (confirm('确定发送吗？')) {
          statusTable = self.attr('status-table');
          uid = $('#uid').val();
          content = $('#msgTpl').val()+$('#msgInput').val() + $('#msgInput').val();
          console.log({pushType:pushType,uid:uid,mobile:mobile.val(),content:'123'})
          if (uid>0) {
            $.ajax({
                type: "post",
                url: operaController+'/pushMsg',
                data: {pushType:pushType,uid:uid,mobile:mobile.val(),content:content},
                beforeSend: function( xhr ) {
                    self.prop('disabled', true);
                    msgBox.text('发送中...').removeClass('label-success').removeClass('label-warning').addClass('label-info').show();
                },
                error: function( xhr ) {
                    msgBox.text('发送失败').removeClass('label-success').removeClass('label-info').addClass('label-warning').show();
                },
                complete: function( xhr ) {
                    self.prop('disabled', false);
                }
            }).done(function(data) {
                msgBox.text('已发送！').removeClass('label-warning').removeClass('label-info').addClass('label-success').show();
                if(pushType=='hx'){
                  var history = JSON.parse(data);
                  console.log(history)

                  var commentHtml = '';
                  for (var key in history) {
                    if (history.hasOwnProperty(key)) {
                      commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-3">'+key+'</div><div class="col-md-9">'+history[key]+'</div></li>';
                    }
                  }

                  console.log(commentHtml)
                  $('#hxHistory').html(commentHtml)
                }
            });
          }
        }
    })

    $('.openWorks').click(function () {
      rowIndex = $('table tr').index($(this).closest('tr'));
      var commentData = $(this).data('works');
      var artTitle = $(this).data('title');
      <!-- console.log(commentData) -->

      var commentHtml = '';
      for (var i = 0; i < commentData.length; i++) {
        commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-1"><img src="{{$serverUrl}}/'+commentData[i].avatar+'" style="height: 35px;width: 35px"></div><div class="col-md-11"><h4 class="list-group-item-heading">'+commentData[i].name+' - '+commentData[i].role+' - '+commentData[i].time+'</h4><p class="list-group-item-text">'+commentData[i].category+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="" data-id="'+commentData[i].id+'"></i></a></li>';
      }
      $('#worksModal').find('.modalTitle').html(artTitle).end().find('.modal-body .list-group').html(commentHtml);
    })
    <!--jQuery 提交表单，实现DELETE删除资源-->
    //jQuery submit form
    $('body').on('click', '.delete_item', function () {
        var self = $(this);
        var commentIndex = $('#commentBox li').index(self.closest('li'));
        if (confirm('确定删除吗？')) {
            var id = $(this).data('id');
            var action = 'delWork/';

            $.post("{{ route('admin.person.index') }}/"+action + id, function(data) {
                self.closest('.list-group-item').remove();
                var trs = $('table tr');
                var modalBtn = trs.eq(rowIndex).find('.openWorks');

                //trs.eq(rowIndex).find('.numBox').text($('#commentBox li').length);
                var commentData = modalBtn.data('works');
                <!-- console.log(commentData) -->
                commentData.splice(commentIndex, 1);
                <!-- console.log(commentIndex,commentData) -->
                modalBtn.data('works',commentData);
            })

        }
    });
@stop
