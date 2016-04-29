@extends('layout._back')

@section('content-header')
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
          <!-- Small boxes (Stat box) -->
          <div class="row">
            <!-- <div class="col-lg-3 col-xs-6">
              small box
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>150<sup style="font-size: 20px">个</sup></h3>
                  <p>本周新增话题</p>
                </div>
                <div class="icon">
                  <i class="ion ion-chatboxes"></i>
                </div>
                <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div> --><!-- ./col -->
            <div id="container" style="min-width:700px;height:300px"></div>
            <div class="col-md-12">
              <div class="col-md-4">
                <p>本月</p>
                <h3>{{$monthCount}}</h3>
              </div>
              <div class="col-md-4">
                <p>本周</p>
                <h3>{{$weekCount}}</h3>
              </div>
              <div class="col-md-4"></div>
            </div>
            <!-- <div class="col-lg-3 col-xs-6">
              small box
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>44<sup style="font-size: 20px">人</sup></h3>
                  <p>本周新增注册用户</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div> --><!-- ./col -->
            <!-- <div class="col-lg-3 col-xs-6">
              small box
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>65<sup style="font-size: 20px">人次</sup></h3>
                  <p>本周活跃用户访问量</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div> --><!-- ./col -->
          </div><!-- /.row -->
@stop

@section('extraPlugin')
<script src="{{ asset('static/js/highcharts.js') }}" type="text/javascript"></script>
@stop

@section('filledScript')
dates = []
for(i = 1; i < 31; i += 1){
            dates.push(i);
    }
$(function () {
    $('#container').highcharts({
        title: {
            text: '本月文章统计',
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
        
@stop