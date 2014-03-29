angular.module('moveoomph').controller 'SidebarCtrl', ($scope, $http) ->

  $scope.page = '/'

  $scope.setPage = (page) ->
    $scope.page = page