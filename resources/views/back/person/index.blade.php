@extends('layout._back')

@section('content-header')
@parent
          <a href="{{ route('admin.person.create') }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i> 新增用户</a>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">用户管理</li>
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

              <!-- <a href="{{ route('admin.person.create') }}" class="btn btn-primary margin-bottom">新增管理员</a> -->

              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">用户列表</h3>
                  <div class="box-tools">
                    <form action="{{ route('admin.person.index') }}" method="get">
                      <div class="input-group">
                        <input type="text" class="form-control input-sm pull-right" name="s_name" value="{{ Input::get('s_name') }}" style="width: 150px;" placeholder="搜索用户名">
                        <input type="text" class="form-control input-sm pull-right" name="s_phone" value="{{ Input::get('s_phone') }}" style="width: 150px;" placeholder="搜索手机号">
                        <div class="input-group-btn">
                          <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div><!-- /.box-header -->
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
                      @foreach ($persons as $user)
                      <tr>
                        <td>
                          <a href="{{ route('admin.person.index') }}/{{ $user->uid }}/edit"><i class="fa fa-fw fa-edit" title="修改"></i></a>  
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
                                <a href="javascript:void(0)" data-title="{{ $user->name }}" data-works="{{ $user->works }}" class="openModal" data-toggle="modal" data-target="#pageModal"><i class="fa fa-file-video-o"></i></a>
                            @endif
                        </td>
                        <td class="text-muted">{{ $user->likeNum }}</td>
                        <td class="text-muted">{{ $user->viewNum }}</td>
                        <td class="text-muted">{{ $user->status }}</td>
                        <td>{{ date('H:i m/d/Y', strtotime($user->updTime)) }}</td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  {!! $persons->render() !!}
                </div>

                <!--隐藏型删除表单-->
                <form method="post" action="{{ route('admin.person.index') }}" accept-charset="utf-8" id="hidden-delete-form">
                <input name="_method" type="hidden" value="delete">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                </form>

              </div>
    <div class="modal fade" id="pageModal" tabindex="-1" role="dialog" aria-labelledby="chatHistoryModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title text-center row" id="myModalLabel">
              <span class="pull-left"><i class="icon fa fa-file"></i> 代表作品</span><span id="modalTitle"></span>
            </h4>
         </div>
         <div class="modal-body">
            <ul class="list-group"></ul>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
@stop


@section('filledScript')
    $('.openModal').click(function () {
      var commentData = $(this).data('works');
      var artTitle = $(this).data('title');
      <!-- console.log(commentData) -->
      var commentHtml = '';
      for (var i = 0; i < commentData.length; i++) {
        commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-1"><img src="{{$serverUrl}}/'+commentData[i].avatar+'" style="height: 35px;width: 35px"></div><div class="col-md-11"><h4 class="list-group-item-heading">'+commentData[i].name+' - '+commentData[i].role+' - '+commentData[i].time+'</h4><p class="list-group-item-text">'+commentData[i].category+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="delComment/" data-id="'+commentData[i].id+'"></i></a></li>';
      }
      $('#pageModal').find('#modalTitle').html(artTitle).end().find('.modal-body .list-group').html(commentHtml);
    })
        <!--jQuery 提交表单，实现DELETE删除资源-->
        //jQuery submit form
        $('.delete_item').click(function(){
            var action = '{{ route('admin.article.index') }}';
            var id = $(this).data('id');
            var new_action = action + '/' + id;
            $('#hidden-delete-form').attr('action', new_action);
            $('#hidden-delete-form').submit();
        });
@stop
