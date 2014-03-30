angular.module('moveoomph').controller 'PagesCtrl', ($scope, $http, $timeout, $interval) ->

  $scope.inquiry = {}
  $scope.inquirySubmitted = false
  $scope.loading = false
  $scope.progress = 0


  $scope.getEstimate = ->
    $http
      url: '/inquiries'
      method: 'POST'
      data: $scope.inquiry
    .success (data) ->
      progressGrower = $interval ->
        $scope.progress += 2
      , 35
      $scope.inquirySubmitted = true
      $scope.loading = true
      $timeout -> 
        $scope.loading = false
        $interval.cancel progressGrower
      , 3000