@extends('layout._back')

@section('content-header')
@parent
          <h1>文章统计</h1>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">内容管理 - 文章统计</li>
          </ol>
@stop

@section('content')


              <div class="box box-primary">
                <div class="box-body table-responsive">
                  <svg id="svg" width="100%" height="120"></svg>
                </div><!-- /.box-body -->

              </div>
              <!-- /.modal -->
@stop

@section('extraPlugin')
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="{{ asset('static/js/calendar_graph.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
  window.onload = function(){
            var data = [0,1,2,3,4,3,2,4,4,0,0,2,1,4,5,1,5,3,2];
            show_calendar_graph("#svg",data);
          }
@stop
