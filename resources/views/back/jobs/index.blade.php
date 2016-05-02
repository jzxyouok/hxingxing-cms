@extends('layout._back')

@section('content-header')
@parent
          <a href="{{ route('admin.jobs.create') }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i> 新增职位</a>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">职位管理</li>
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

              <!-- <a href="{{ route('admin.jobs.create') }}" class="btn btn-primary margin-bottom">新增管理员</a> -->

              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">职位列表</h3>
                  <div class="box-tools">
                    <form action="{{ route('admin.jobs.index') }}" method="get">
                      <div class="input-group">
                        <input type="text" class="form-control input-sm pull-right" name="s_name" value="{{ Input::get('s_name') }}" style="width: 150px;" placeholder="搜索职位名">
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
                        <th>职位名</th>
                        <th>剧目</th>
                        <th>演员类型</th>
                        <th>薪资</th>
                        <th>说明</th>
                        <th>角色名</th>
                        <th>演艺风格</th>
                        <th>身高</th>
                        <th>年龄</th>
                        <th>体重</th>
                        <th>角色说明</th>
                        <th><i class="fa fa-heart"></i> 收藏</th>
                        <th><i class="fa fa-eye"></i> 查看</th>
                        <th>创建于</th>
                      </tr>
                      <!--tr-th end-->
                      @foreach ($items as $user)
                      <tr>
                        <td>
                          <a href="{{ route('admin.jobs.index') }}/{{ $user->id }}/edit">{{ $user->name }}</a>  
                        </td>
                        <td>@if($user->opera){{ $user->opera->name }}@endif</td>
                        <td class="text-muted">{{ $user->actorType }}</td>
                        <td class="text-muted">{{ $user->salary }}</td>
                        <td class="text-muted">{{ $user->descrip }}</td>
                        <td class="text-muted">{{ $user->role }}</td>
                        <td class="text-muted">{{ $user->style1 }}</td>
                        <td class="text-muted">{{ $user->height }}</td>
                        <td class="text-muted">{{ $user->age }}</td>
                        <td class="text-muted">{{ $user->weight }}</td>
                        <td class="text-muted">{{ $user->roleDescrip }}</td>
                        <td class="text-muted">{{ $user->likeNum }}</td>
                        <td class="text-muted">{{ $user->viewNum }}</td>
                        <td>{{ date('H:i m/d/Y', strtotime($user->updTime)) }}</td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  {!! $items->render() !!}
                </div>

                <!--隐藏型删除表单-->
                <form method="post" action="{{ route('admin.jobs.index') }}" accept-charset="utf-8" id="hidden-delete-form">
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
        commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-1"><img src="{{$serverUrl}}/'+commentData[i].avatar+'" style="height: 35px;width: 35px"></div><div class="col-md-11"><h4 class="list-group-item-heading">'+commentData[i].name+' - '+commentData[i].role+' - '+commentData[i].time+'</h4><p class="list-group-item-text">'+commentData[i].category+'</p></div></li>';
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
