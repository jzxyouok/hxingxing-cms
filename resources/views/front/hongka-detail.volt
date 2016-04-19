<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
        <title>详情 | {{news.title}}</title>
        {{ stylesheet_link("../../css/ionic.min.css") }}
        {{ javascript_include("../../js/ionic.bundle.min.js") }}

        {{ javascript_include("../../js/jquery-2.0.0.min.js") }}
        <script>
            var newsId = {{news.id}};
            var liked = {{liked}};
            var token = '{{token}}';
            var likeNum = {{news.likeNum}};
        </script>
        {{ javascript_include("../../js/likeCtrl.js") }}
        {{ javascript_include("../../js/likeService.js") }}
        <script>
            var likeApp = angular.module('likeApp', ['likeCtrl', 'likeService']);
            angular.module('likeApp').config(function($interpolateProvider){
                $interpolateProvider.startSymbol('<{').endSymbol('}>');
            });
        </script>
        <style>
            .button.icon-left{color: #666}
            .card{margin: 0;    box-shadow: inherit;}
            .item-divider {
    background-color: inherit;
}
        </style>
    </head>
    <body ng-app="likeApp" ng-controller="mainController">
    <div class="bar bar-header bar-light">
        <a href="../../news/{{token}}" class="button icon-left ion-chevron-left button-clear button-dark"></a>
        <h1 class="title">{{news.title}}</h1>
    </div>
    
    <div class="content has-header has-footer">
        <div class="card">
            <div class="item item-divider">
             {{news.author}}
            </div>
            <div class="item item-body">
              {{news.text}}
            </div>
        </div>
    </div>

    <div class="bar bar-footer bar-light row">
        <div class="col col-center text-center"><a href="#" class="button icon-left ion-share button-clear"></a></div>
        <div class="col col-center text-center"><a href="#" ng-click="newsLike({{news.id}})" class="button icon-left ion-thumbsup button-clear <{likeBtnClass}>"><{likeNum}></a></div>
        <div class="col col-center text-center"><a href="../../newsCommentPage/{{news.id}}/{{token}}" class="button icon-left ion-chatbox-working button-clear">{{news.commentNum}}</a></div>
    </div>
  </body>
</html>
