angular.module('moveoomph', ['ngRoute', 'ngAnimate', 'ngCookies',
  'ajoslin.promise-tracker', 'ui.bootstrap'])

angular.module('moveoomph').config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data

angular.module('moveoomph').config(($routeProvider) ->
  $routeProvider.when('/',
    controller: 'PagesCtrl'
    templateUrl: "/assets/pages/home.tpl.html"
  ).when(

  )).run(($rootScope, $location) ->
    
  )