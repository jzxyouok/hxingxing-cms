@extends('layout._back')

@section('content-header')
<link type="text/css" rel="stylesheet" href="../plugins/datepicker/datepicker3.css"/>
@parent
          <h1>
            控制面板
            <small>概述</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="{{ route('admin') }}"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">控制面板 - 概述</li>
          </ol>
@stop

@section('content')
          <div class="row">
            @if($manageSystem)
            <div style="    position: absolute;z-index: 9;" class="input-append date" id="datepicker" data-date="{{$curMonth}}" data-date-format="yyyy-mm">
              <input size="12" type="text" readonly="readonly" name="date" value="{{$curMonth}}">
              <span class="add-on"><i class="fa fa-calendar"></i></span>      
            </div>
              <div id="container" style="height:250px"></div>
            @else
              <h3 class="text-center">欢迎!</h3>
            @endif
          </div><!-- /.row -->
@stop

@section('extraPlugin')
<script src="{{ asset('static/js/highcharts.js') }}" type="text/javascript"></script>
<script src="{{ asset('plugins/datepicker/bootstrap-datepicker.js') }}" type="text/javascript"></script>
<script src="{{ asset('plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
@if($manageSystem)
$("#datepicker").datepicker( {
    format: "yyyy-mm",
    viewMode: "months", 
    minViewMode: "months",
    autoclose:true,
    language: 'zh-CN'
}).on('changeDate', dateChanged);

function dateChanged(ev) {
console.log(ev)
    $(this).datepicker('hide');
    <!-- location.href = '{{ route('admin.console.index') }}?month='+ev.date -->
}

$("#datepicker").on("dp.change", function(e) {
  <!-- location.href = '{{ route('admin.console.index') }}?month='+e.date -->
});

dates = []
for(i = 1; i < {{$monthEnd}}; i += 1){
            dates.push(i);
    }
$(function () {
    $('#container').highcharts({
        title: {
            text: '{{$month}}月@if($month==$curMonth)(本月)@endif文章统计{{$monthCount}},本周{{$weekCount}}',
            x: -20 //center
        },
        xAxis: {
            categories: dates
        },
        yAxis: {
        title: {
                text: ''
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        credits: {
           enabled: false
        },
        tooltip: {
            valueSuffix: '篇'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: JSON.parse('{{$dataFinal}}'.replace(/&quot;/g, '"'))
    });
});
@endif
@stop