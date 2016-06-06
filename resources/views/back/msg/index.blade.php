@extends('layout._back')

@section('content-header')
@parent
<h3 class="box-title">消息列表(第{{$index}}页)</h3>
@stop

@section('content')
      <div class="box-body table-responsive">
        @if($hxResult)
            @foreach ($groups as $k=>$group)
              <div class="panel panel-default">
                <div class="panel-heading">{{ $k }}</div>
                <div class="panel-body">
                @foreach ($group as $message)
                  <div class="row">
                    <div class="col-md-2">{{ $message['from'] }}</div>
                    <div class="col-md-2">{{ $message['timestamp'] }}</div>
                    <div class="col-md-8">{{ $message['msg'] }}</div>
                  </div>
                @endforeach
                </div>
              </div>
            @endforeach
        @else
          <p>环信请求失败！请刷新重试</p>
        @endif
      </div><!-- /.box-body -->
@if($lastButton)
  <a href="{{ route('admin.msg.index',['page'=>-1]) }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i>上一页</a>
@endif

@if($nextButton)
  <a href="{{ route('admin.msg.index',['page'=>+1]) }}" class="btn btn-primary"><i class="fa fa-fw fa-plus"></i>下一页</a>
@endif

@stop


@section('filledScript')
        <!--jQuery 提交表单，实现DELETE删除资源-->

@stop
