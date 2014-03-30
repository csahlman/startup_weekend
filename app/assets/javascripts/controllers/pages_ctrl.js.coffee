angular.module('moveoomph').controller 'ModalInstanceCtrl', ($scope, $modalInstance, selectedDeal, inquiry) ->
  $scope.selectedDeal = selectedDeal
  $scope.inquiry = inquiry
  $scope.maxRating = 5
  $scope.isReadOnly = true

  $scope.getAverage = (array, field) ->
    len = array.length
    sum = array.reduce((prev, current) ->
      prev + current[field]
    , 0)
    sum / len

  $scope.selectedDeal.averageRating = $scope.getAverage($scope.selectedDeal.reviews, 'rating')


angular.module('moveoomph').controller 'PagesCtrl', ($scope, $http, $timeout, $interval, $modal) ->

  $scope.inquiry = {}
  $scope.inquirySubmitted = false
  $scope.loading = false
  $scope.progress = 0
  $scope.deals = []
  $scope.selectedDeal = null

  deals = [
    {
      name: 'Paul Hauls', price: '555', moveDuration: '6', ourThoughts: 'The best!, Paul can really haul', reviews: [
        { rating: 5, description: "Had an A+ moving experience, thanks so much!" }
      ]
    },
    {
      name: 'Mary Can Carry', price: '680', moveDuration: '4', ourThoughts: 'We like Mary!  A lot of people use her', reviews: [
        { name: "Steve Q", rating: 5, description: "Had an A+ moving experience, thanks so much!" },
        { name: "Diet Coke Afficienado", rating: 4, description: "Guys worked hard, I had a good experience" },
        { name: "Steve Joe", rating: 1, description: "Had lazy movers who fought the whole time, worked slowly, and weren't careful with my stuff" }
      ]
    },
    {
      name: 'Man With a Van', price: '345', moveDuration: '9', ourThoughts: 'Affordable, but slower.  Good budget option', reviews: [
        { name: "Joe R", rating: 5, description: "My mover (Jim) worked amazingly hard.  Impressed he could do it by himself!" },
        { name: "Jane Packs",rating: 4, description: "A little slow, but I liked Jim a lot." },
        { name: "Foobar", rating: 3, description: "Jim smells" }
      ]
    },
    {
      name: "Rory's Lorie", price: '800', moveDuration: '7', ourThoughts: "Rory isn't super punctual, but is careful with your belongings", reviews: [
        { name: "Nancy", rating: 5, description: "Had an A+ moving experience, thanks so much!" },
        { name: "Joe R", rating: 3, description: "He did a good job, but showed up two hours late..."},
        { name: "Raquan", rating: 2, description: "Lost a box and was an hour late, also expensive" }
      ]
    },
    {
      name: 'Chuck Has a Truck', price: '600', moveDuration: '6', ourThoughts: 'Chuck is new, but has good yelp reviews.  Use at your own risk.', reviews: [
        { name: "Joe R", rating: 5, description: "Chuck is the best!!!" }
      ]
    },
    {
      name: 'Zack Packs', price: '700', moveDuration: '5', ourThoughts: "We don't know Zack", reviews: []
    }
  ]


  $scope.getEstimate = ->
    $http
      url: '/inquiries'
      method: 'POST'
      data: $scope.inquiry
    .success (data) ->
      progressGrower = $interval ->
        $scope.progress += 20
      , 50
      $scope.inquirySubmitted = true
      $scope.loading = true
      $timeout -> 
        $scope.loading = false
        $interval.cancel progressGrower
        $timeout ->
          $scope.deals = deals
        , 200
      , 1500

  $scope.loadModal = (deal) ->
    $scope.selectedDeal = deal
    modalInstance = $modal.open(
      templateUrl: '/assets/directives/modal.tpl.html'
      controller: 'ModalInstanceCtrl'
      resolve: 
        selectedDeal: ->
          $scope.selectedDeal
        inquiry: ->
          $scope.inquiry
    )


