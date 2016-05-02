@extends('layout._back')

@section('content-header')
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
         <div class="modal-body" id="commentBox">
            <ul class="list-group" ></ul>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
@stop


@section('filledScript')
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var token = '{{ csrf_token() }}';
    var rowIndex;
    $('.openModal').click(function () {
      rowIndex = $('table tr').index($(this).closest('tr'));
      var commentData = $(this).data('works');
      var artTitle = $(this).data('title');
      <!-- console.log(commentData) -->

      var commentHtml = '';
      for (var i = 0; i < commentData.length; i++) {
        commentHtml += '<li class="list-group-item container-fluid"><div class="col-md-1"><img src="{{$serverUrl}}/'+commentData[i].avatar+'" style="height: 35px;width: 35px"></div><div class="col-md-11"><h4 class="list-group-item-heading">'+commentData[i].name+' - '+commentData[i].role+' - '+commentData[i].time+'</h4><p class="list-group-item-text">'+commentData[i].category+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="" data-id="'+commentData[i].id+'"></i></a></li>';
      }
      $('#pageModal').find('#modalTitle').html(artTitle).end().find('.modal-body .list-group').html(commentHtml);
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
                var modalBtn = trs.eq(rowIndex).find('.openModal');

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
