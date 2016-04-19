@extends('layout._front')

@section('bootstrapContent')
<link href="{{ asset('static/css/ionic.min.css') }}" rel="stylesheet">
<script src="{{ asset('static/js/ionic.bundle.min.js') }}" type="text/javascript"></script>
<style type="text/css">
    .list .item{border-left:0;border-right:0}
    .slider-slide h4{position: absolute;color: white;left: 20px;top: 150px;}
    .slider-slide img{width: 100%;height: 200px}
    .slider-pager{bottom: 0}
    .item-big{padding: 8px}
    .item-big h2{margin-bottom: 12px;position: absolute;bottom: 0;left: 8px;right: 8px;color: white;background: rgba(0,0,0,0.6)!important;}
    .icon-row{bottom: 5px;position: absolute;}
    .pagination{    margin: 0 0 40px;}
    </style>
    <script type="text/javascript">
        angular.module('ionicApp', ['ionic'])
        .controller("MyCtrl",function($scope,$ionicSlideBoxDelegate){
        $scope.go_next = function(index){
        $ionicSlideBoxDelegate.next();
        };
        })
    </script>

<div class="container content has-header has-footer" id="content" ng-app="ionicApp" ng-controller="MyCtrl">

    @inject('article_service', 'Douyasi\Services\ArticleService') {{-- Blade模版里面服务注入 Laravel 5.1 LTS 新增功能 --}}
        <div class="col-lg-11">
            <ion-slide-box style="height:200px" auto-play="true" does-continue="true" slide-interval="3000">
                @foreach($slides as $art)
                    <ion-slide>
                        <a href="{{ $article_service->getArticleSlug($art->slug, $art->id, $art->meta->slug, $art->meta->id) }}"><img src="{{$art->thumb}}"/><h4>{{$art->title}}</h4></a>
                    </ion-slide>
                @endforeach
            </ion-slide-box>

            <div class="list">
                @foreach($articles as $art)
                    <a class="item @if ($art->category_id != 2) item-thumbnail-left @else item-big @endif" href="{{ $article_service->getArticleSlug($art->slug, $art->id, $art->meta->slug, $art->meta->id) }}">
                        @if ($art->category_id == 2)
                            <p>{{ date('H:i m/d/Y', strtotime($art->updated_at)) }}</p>
                            <h2>{{ $art->title }}</h2>
                            <img style="height: 100px;width: 100%" src="{{$art->thumb}}">
                        @elseif ($art->category_id ==1)
                            <img src="{{$art->thumb}}">
                            <h2 style="margin-top: 10px">{{$art->title}}</h2>
                            <p class="icon-row">
                                <font style="margin-right: 8px"><i class="icon ion-thumbsup {% if $art->likeId>0 %}positive{% endif %}"></i> {{$art->likeNum}}</font>
                            <i class="icon ion-chatbox-working"></i> {{$art->commentNum}}</p>
                        @endif
                    </a>
                @endforeach
            </div>
            
            <!--分页-->
            {!! $articles->render() !!}
        </div>
    </div>
@stop
