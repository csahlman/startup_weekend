angular.module('fantasy_sports_dashboard', ['ngRoute', 'ngAnimate', 'ngCookies',
  'ajoslin.promise-tracker'])

angular.module('fantasy_sports_dashboard').config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data