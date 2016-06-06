@extends('layout._back')

@section('content-header')
@parent
      <h2></h2>
          
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">内容管理 - 反馈</li>
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

              <!-- <a href="{{ route('admin.user.create') }}" class="btn btn-primary margin-bottom">新增管理员</a> -->

              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">所有反馈</h3>
                  <div class="box-tools">
                    <form action="{{ route('admin.feedback.index') }}" method="get">
                      <div class="input-group">
                        <input type="text" class="form-control input-sm pull-right" name="s_email" value="{{ Input::get('s_email') }}" style="width: 150px;" placeholder="搜索邮件">
                        <input type="text" class="form-control input-sm pull-right" name="s_feedback" value="{{ Input::get('s_feedback') }}" style="width: 150px;" placeholder="搜索内容">
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
                        <th>内容</th>
                        <th>邮件</th>
                        <th>时间</th>
                      </tr>
                      <!--tr-th end-->
                      @foreach ($reports as $user)
                      <tr>
                        <td>{{ $user->feedback }}</td>
                        <td class="text-muted"><button class="btn btn-primary btn-sm"><i class="fa fa-envelope-o"></i></button>{{ $user->email }}</td>
                        <td>{{ date('H:i m/d/Y', strtotime($user->updTime)) }}</td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  {!! $reports->render() !!}
                </div>

                <!--隐藏型删除表单-->
                <form method="post" action="{{ route('admin.user.index') }}" accept-charset="utf-8" id="hidden-delete-form">
                <input name="_method" type="hidden" value="delete">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                </form>

              </div>
              <div class="modal fade" id="chatHistoryModal" tabindex="-1" role="dialog" aria-labelledby="chatHistoryModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               聊天记录
            </h4>
         </div>
         <div class="modal-body">
            <ul class="list-group">
              <li class="list-group-item"></li>
            </ul>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary">
               拉黑
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div><!-- /.modal -->
@stop


@section('filledScript')
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
