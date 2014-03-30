angular.module('moveoomph').controller 'PagesCtrl', ($scope, $http, $timeout, $interval) ->

  $scope.inquiry = {}
  $scope.inquirySubmitted = false
  $scope.loading = false
  $scope.progress = 0
  $scope.deals = []


  $scope.getEstimate = ->
    $http
      url: '/inquiries'
      method: 'POST'
      data: $scope.inquiry
    .success (data) ->
      progressGrower = $interval ->
        $scope.progress += 11
      , 100
      $scope.inquirySubmitted = true
      $scope.loading = true
      $timeout -> 
        $scope.loading = false
        $interval.cancel progressGrower
        $timeout ->
          $scope.deals = [1,2,3,4,5,6]
        , 200
      , 1500