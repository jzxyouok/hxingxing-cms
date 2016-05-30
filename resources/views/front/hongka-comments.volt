<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>评论 | {{news.title}}</title>
    {{ stylesheet_link("../../css/ionic.min.css") }}
    {{ javascript_include("../../js/ionic.bundle.min.js") }}
  
    <!-- ANGULAR -->
    {{ javascript_include("../../js/jquery-2.0.0.min.js") }}
    {{ javascript_include("../../js/commentCtrl.js") }}
    {{ javascript_include("../../js/commentService.js") }}
    <script>
      var commentApp = angular.module('commentApp', ['commentCtrl', 'commentService']);
      var newsId = {{news.id}};
      var token = '{{token}}';
      angular.module('commentApp').config(function($interpolateProvider){
        $interpolateProvider.startSymbol('<{').endSymbol('}>');
      });
    </script>
</head>
<body ng-app="commentApp" ng-controller="mainController">
    <div class="bar bar-header bar-light">
        <a href="../../newsItem/{{news.id}}/{{token}}" class="button icon-left ion-chevron-left button-clear button-dark"></a>
        <h1 class="title">{{news.title}}</h1>
    </div>

    <div class="content has-header has-footer ionic-pseudo">
      <div class="list">
      <div ng-hide="loading" ng-repeat="comment in comments">
        <div class="item item-avatar-left" href="#">
            <img src="../../img/<{comment.avatar}>">
            <!-- <span ng-if="comment.avatar==''"><img src="../img/iphone.png"></span> -->
            <!-- <a href="#" ng-click="deleteComment(comment.id)">Delete</a> -->
          <p><{comment.name}></p>
          <p><{comment.comment}></p>
          <p><{comment.updTime| date:'MM-dd HH:mm'}></p>
        </div>
      </div>
      </div>
      
      <p ng-show="loading">Loading...</p>
      <form ng-submit="submitComment()">
          <input type="hidden" ng-model="commentData.newsId">
          <label class="item item-textarea">
            <input type="text" name="comment" ng-model="commentData.comment" value="<{commentInput}>">
          </label>
          <div class="padding">
        <button type="submit" class="button button-block button-positive">发布</button>
      </div>
      </form>
    </div>

    <div class="bar bar-footer bar-light">
    </div>
</body>
</html>