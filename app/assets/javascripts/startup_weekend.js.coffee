angular.module('startup_weekend', ['ngRoute', 'ngAnimate', 'ngCookies',
  'ajoslin.promise-tracker', 'ui.bootstrap'])

angular.module('startup_weekend').config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data

# angular.module('startup_weekend').config(($routeProvider) ->
#   $routeProvider.when('/',
#     controller: 'LineUpsCtrl'
#     templateUrl: "/assets/pages/lineups.tpl.html"
#   )).run(($rootScope, $location) ->
    
#   )