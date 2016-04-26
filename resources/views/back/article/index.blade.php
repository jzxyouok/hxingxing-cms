@extends('layout._back')

@section('content-header')
@parent
          <a href="{{ route('admin.article.create') }}" class="btn btn-primary"><i class="fa fa-fw fa-pencil"></i> 撰写新文章</a>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">内容管理 - 文章</li>
          </ol>
          <style>
          .table>tbody>tr>td{vertical-align: middle;}
          </style>
@stop

@section('content')
              @if(Session::has('fail'))
                <div class="alert alert-warning alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4>  <i class="icon icon fa fa-warning"></i> 提示！</h4>
                  {{ Session::get('fail') }}
                </div>
              @endif
              @if(Session::has('message'))
                <div class="alert alert-success alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4>  <i class="icon fa fa-check"></i> 提示！</h4>
                  {{ Session::get('message') }}
                </div>
              @endif

              <!-- <a href="{{ route('admin.article.create') }}" class="btn btn-primary margin-bottom">撰写新文章</a> -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">文章列表</h3>
                    <div class="box-tools">
                        <form action="{{ route('admin.article.index') }}/?tab=1" method="get">
                            <!--                            <a href=" route('admin.article.index') / $art->id /edit">-->
                            <div class="input-group">
                                <input type="text" class="form-control input-sm pull-right" name="s_title" value="{{ Input::get('s_title') }}" style="width: 150px;" placeholder="搜索文章标题">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.box-header -->


            </div>
              <div class="nav-tabs-custom">

                    <ul class="nav nav-tabs">
                        <li @if($tab == 0)class="active"@endif><a href="#tab_1" data-toggle="tab" aria-expanded="true">草稿</a></li>
                        <li @if($tab == 1)class="active"@endif><a href="#tab_2" data-toggle="tab" aria-expanded="false">已发布</a></li>
                    </ul>

                    <div class="tab-content">
<!--                        <div class="tab-pane active" id="tab_1">-->
                        <div  @if($tab == 0)class="tab-pane active"@else class="tab-pane"@endif id="tab_1">
                            <div class="box-body table-responsive">
                                <div class="tablebox-controls">
                                    <!-- Check all button -->
                                    <!-- <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o" title="全选/反全选"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-trash-o" title="删除"></i></button> -->
                                    <!-- <button class="btn btn-default btn-sm"><i class="fa fa-refresh" title="刷新"></i></button> -->
                                </div>
                                <table class="table table-hover table-bordered table-condensed" id="main-table1">
                                    <tbody>
                                    <!--tr-th start-->
                                    <tr>
                                        <!-- <th>选择</th> -->
                                        <!-- <th>推荐位</th> -->
                                        <th>标题</th>
                                        <th>作者</th>
                                        <th>显示作者</th>
                                        <th><i class="fa fa-arrow-up"></i> 是否置顶</th>
                                        <th><i class="fa fa-eye"></i> 看</th>
                                        <th><i class="fa fa-thumbs-up"></i> 赞</th>
                                        <th><i class="fa fa-comments"></i> 评</th>
                                        <!-- <th>Slug</th> -->
                                        <th>分类</th>
                                        <th><i class="fa fa-clock-o"></i> 创建于</th>
                                        <th><i class="fa fa-clock-o"></i> 最后修改</th>
                                        <th>操作</th>
                                    </tr>
                                    <!--tr-th end-->

                                    @foreach ($draft_articles as $k=> $art)
                                    <tr class="row-item">
                                        <!-- <td class="table-operation"><input type="checkbox" value="{{ $art->id }}" name="checkbox[]"></td> -->
                                        <!-- <td class="text-green">{!! flag_tag($art->flag, $flags) !!}</td> -->
                                        <td class="text-muted"><a href="{{ route('admin.article.index') }}/{{ $art->id }}/edit">{{ str_limit($art->title,50) }}</a></td>
                                        <td class="text-muted">{{ $art->user->username }}</td>
                                        <td class="text-muted">{{ $art->author }}</td>
                                        <td class="text-muted">{!! show_check($art->is_top) !!}</td>
                                        <!-- <td class="text-green">
                                          @if(empty($art->slug))
                                          {{ $art->id }}
                                          @else
                                          {{ $art->slug }}
                                          @endif
                                        </td> -->
                                        <td>
                          <span class="showBox">
                            <span class="numTxt">{{ $art->viewNum }}</span> <a href="javascript:void(0);" class="editViewNum"><i class="fa fa-edit"></i></a>
                          </span>
                          <span class="editBox" style="display:none">

                              <input type="number" value="{{ $art->viewNum }}" style="width: 60px;">
                              <label class="control-label">是否显示浏览数</label>
                              <div class="input-group">
                                  <input type="radio" name="is_show" value="0" {{ ((isset($art) ? $art->is_show_viewNum : 0) === 0) ? 'checked' : '' }}>
                                  <label class="choice" for="radiogroup">否</label>
                                  <input type="radio" name="is_show" value="1" {{ ((isset($art) ? $art->is_show_viewNum : 0) === 1) ? 'checked' : '' }}>
                                  <label class="choice" for="radiogroup">是</label>
                              </div>
                              <a href="javascript:void(0);" class="subViewNum" data-id="{{ $art->id }}">
                                  <i class="fa fa-save"></i>
                              </a>
                          </span>
                                        </td>
                                        <td>{{ $art->likeNum }}</td>
                                        <td>@if($art->commentNum>0)<button data-title="{{ str_limit($art->title,50) }}" data-comment="{{ $art->newsComment }}" data-newsId="{{ $art->id }}" class="btn btn-default btn-sm openModal" data-toggle="modal" data-target="#pageModal"><i class="fa fa-fw fa-comments"></i></button> @endif<span class="numBox">{{ $art->commentNum }}</span></td>
                                        <td>
                                            @if($art->thumb)
                                            <img src="{{ url() }}/{{ $art->thumb }}" style="height: 35px;width: 35px">
                                            @endif
                                            {{ $art->meta->name }}</td>
                                        <td>{{ date('H:i m-d-Y', strtotime($art->created_at)) }}</td>
                                        <td>{{ date('H:i m-d', strtotime($art->updated_at)) }}</td>
                                        <td>
                                            @if($canDel)
                                            <a href="javascript:void(0);"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-id="{{ $art->id }}" data-action=''></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach

                                    </tbody>
                                </table>
                            </div><!-- /.box-body -->
                            <div class="box-footer clearfix">
                                {!! $draft_articles->appends(['tab'=>0])->render() !!}
                            </div>
                        </div>

                        <div @if($tab == 1)class="tab-pane active"@else class="tab-pane"@endif id="tab_2">
                            <div class="box-body table-responsive">
                                <div class="tablebox-controls">
                                    <!-- Check all button -->
                                    <!-- <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o" title="全选/反全选"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-trash-o" title="删除"></i></button> -->
                                    <!-- <button class="btn btn-default btn-sm"><i class="fa fa-refresh" title="刷新"></i></button> -->
                                </div>
                                <table class="table table-hover table-bordered table-condensed" id="main-table2">
                                    <tbody>
                                    <!--tr-th start-->
                                    <tr>
                                        <!-- <th>选择</th> -->
                                        <!-- <th>推荐位</th> -->
                                        <th>标题</th>
                                        <th>作者</th>
                                        <th>显示作者</th>
                                        <th><i class="fa fa-arrow-up"></i> 是否置顶</th>
                                        <th><i class="fa fa-eye"></i> 看</th>
                                        <th><i class="fa fa-thumbs-up"></i> 赞</th>
                                        <th><i class="fa fa-comments"></i> 评</th>
                                        <!-- <th>Slug</th> -->
                                        <th>分类</th>
                                        <th><i class="fa fa-clock-o"></i> 创建于</th>
                                        <th><i class="fa fa-clock-o"></i> 最后修改</th>
                                        <th>操作</th>
                                    </tr>
                                    <!--tr-th end-->

                                    @foreach ($pub_articles as $k=> $art)
                                    <tr class="row-item">
                                        <!-- <td class="table-operation"><input type="checkbox" value="{{ $art->id }}" name="checkbox[]"></td> -->
                                        <!-- <td class="text-green">{!! flag_tag($art->flag, $flags) !!}</td> -->
                                        <td class="text-muted"><a href="{{ route('admin.article.index') }}/{{ $art->id }}/edit">{{ str_limit($art->title,50) }}</a></td>
                                        <td class="text-muted">{{ $art->user->username }}</td>
                                        <td class="text-muted">{{ $art->author }}</td>
                                        <td class="text-muted">{!! show_check($art->is_top) !!}</td>
                                        <!-- <td class="text-green">
                                          @if(empty($art->slug))
                                          {{ $art->id }}
                                          @else
                                          {{ $art->slug }}
                                          @endif
                                        </td> -->
                                        <td>
                          <span class="showBox">
                            <span class="numTxt">{{ $art->viewNum }}</span> <a href="javascript:void(0);" class="editViewNum"><i class="fa fa-edit"></i></a>
                          </span>
                          <span class="editBox" style="display:none">
                            <input type="number" value="{{ $art->viewNum }}" style="width: 60px;">
                            <label class="control-label">是否显示浏览数</label>
                            <div class="input-group">
                                <input type="radio" name="is_show" value="0" {{ ((isset($art) ? $art->is_show_viewNum : 0) === 0) ? 'checked' : '' }}>
                                <label class="choice" for="radiogroup">否</label>
                                <input type="radio" name="is_show" value="1" {{ ((isset($art) ? $art->is_show_viewNum : 0) === 1) ? 'checked' : '' }}>
                                <label class="choice" for="radiogroup">是</label>
                            </div>
                            <a href="javascript:void(0);" class="subViewNum" data-id="{{ $art->id }}">
                                <i class="fa fa-save"></i>
                            </a>
                          </span>
                                        </td>
                                        <td>{{ $art->likeNum }}</td>
                                        <td>@if($art->commentNum>0)<button data-title="{{ str_limit($art->title,50) }}" data-comment="{{ $art->newsComment }}" data-newsId="{{ $art->id }}" class="btn btn-default btn-sm openModal" data-toggle="modal" data-target="#pageModal"><i class="fa fa-fw fa-comments"></i></button> @endif<span class="numBox">{{ $art->commentNum }}</span></td>
                                        <td>
                                            @if($art->thumb)
                                            <img src="{{ url() }}/{{ $art->thumb }}" style="height: 35px;width: 35px">
                                            @endif
                                            {{ $art->meta->name }}</td>
                                        <td>{{ date('H:i m-d-Y', strtotime($art->created_at)) }}</td>
                                        <td>{{ date('H:i m-d', strtotime($art->updated_at)) }}</td>
                                        <td>
                                            @if($canDel)
                                            <a href="javascript:void(0);"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-id="{{ $art->id }}" data-action=''></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach

                                    </tbody>
                                </table>
                            </div><!-- /.box-body -->
                              <div class="box-footer clearfix">
                                  {!! $pub_articles->appends(['tab'=>1])->render() !!}
                              </div>
                        </div>
                    </div>
              </div>


    <div class="modal fade" id="pageModal" tabindex="-1" role="dialog" aria-labelledby="pageModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title text-center row" id="myModalLabel">
              <span class="pull-left"><i class="icon fa fa-comments"></i> 评论</span><span id="modalTitle"></span>
            </h4>
         </div>
         <div class="modal-body">
            <ul class="list-group" id="commentBox">
            </ul>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div><!-- /.modal -->
@stop

@section('extraPlugin')
<!--引入iCheck组件-->
<script src="{{ asset('plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var rowIndex;
    var newsId;
    var token = '{{ csrf_token() }}';
    $('.openModal').click(function () {
      rowIndex = $('#main-table tr').index($(this).closest('tr'));
      var commentData = $(this).data('comment');
    console.log(commentData)
      newsId = $(this).data('newsid');

      <!-- console.log(rowIndex,commentData) -->
      var artTitle = $(this).data('title');
      <!-- console.log(commentData) -->
      var commentHtml = '';
      for (var i = 0; i < commentData.length; i++) {
        commentHtml += '<li class="list-group-item container-fluid row-item"><div class="col-md-11"><h4 class="list-group-item-heading">'+commentData[i].comment+'</h4><p class="list-group-item-text">'+commentData[i].updTime.substr(5, 11)+'</p></div><a href="javascript:void(0);" class="col-md-1"><i class="fa fa-fw fa-minus-circle delete_item" title="删除" data-action="delComment/" data-id="'+commentData[i].id+'"></i></a></li>';
      }
      $('#pageModal').find('#modalTitle').html(artTitle).end().find('.modal-body .list-group').html(commentHtml);
    })

    $('.editViewNum').click(function () {
      $(this).closest('td').find('.editBox').show().end().find('.showBox').hide().end().find('input').select();
    })
    $('.subViewNum').click(function () {
      var ptd = $(this).closest('td');
      var aid = $(this).data('id');
      var newNum = ptd.find('input[type="number"]').val();
      var is_show = ptd.find('input[type="radio"]').val();
      $.post("{{ route('admin.article.index') }}/updViewNum/" + aid+"/"+newNum+"/"+is_show, function(data) {
        ptd.find('.numTxt').text(newNum).end().find('.showBox').show().end().find('.editBox').hide().end().addClass('bg-success');
      })
    })

    <!--启用iCheck响应checkbox与radio表单控件-->
    //Enable iCheck plugin for checkboxes
    //iCheck for checkbox and radio inputs
    $('.table-operation input[type="checkbox"]').iCheck({
      checkboxClass: 'icheckbox_flat-blue',
      radioClass: 'iradio_flat-blue'
    });

    //Enable check and uncheck all functionality
    $(".checkbox-toggle").click(function () {
      var clicks = $(this).data('clicks');
      if (clicks) {
        //Uncheck all checkboxes
        $(".table-operation input[type='checkbox']").iCheck("uncheck");
        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
      } else {
        //Check all checkboxes
        $(".table-operation input[type='checkbox']").iCheck("check");
        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
      }
      $(this).data("clicks", !clicks);
    });

    <!--ajax删除文章或评论-->
    //jQuery submit form
    $('body').on('click', '.delete_item', function () {
        var self = $(this);
        var commentIndex = $('#commentBox li').index(self.closest('li'));

        if (confirm('确定删除吗？')) {
          var id = $(this).data('id');
          var action = $(this).data('action');
          if(action!=''){
            $.post("{{ route('admin.article.index') }}/"+action + id+"/"+newsId, function(data) {
              self.closest('.row-item').remove();
              var trs = $('#main-table tr');
              var modalBtn = trs.eq(rowIndex).find('.openModal');

              trs.eq(rowIndex).find('.numBox').text($('#commentBox li').length);
              var commentData = modalBtn.data('comment');
              <!-- console.log(commentData) -->
              commentData.splice(commentIndex, 1);
              <!-- console.log(commentIndex,commentData) -->
              modalBtn.data('comment',commentData);
            })
          }else{
            $.post("{{ route('admin.article.index') }}/"+action + id,{_method:'delete',_token:token}, function(data) {
              self.closest('.row-item').remove();
            })
          }
        }
    });
@stop
