angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope, Stop) {
  var myLatlng = new google.maps.LatLng(-36.848199, 174.754490);
  var mapOptions = {
      center: myLatlng,
      zoom: 17,
      minZoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);
  var infoWindow = new google.maps.InfoWindow();

  Stop.query(function(stops){
    for( i = 0; i < stops.length; i++ ) {
      var stop = stops[i];
      var position = new google.maps.LatLng(stop['stop_lat'], stop['stop_lon']);
      var marker = new google.maps.Marker({
          position: position,
          map: map,
          title: stop['stop_name']
      });
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infoWindow.setContent(
            '<h3>'+stops[i]['stop_name']+'</h3>'+
            '<a class="button button-block button-stable" href="#/tab/dash/'+stops[i]['stop_id']+'">View Stop Times</a>'
            );
          infoWindow.open(map, marker);
        }
      })(marker, i));
    }
  });

  // To use current location as map midpoint
  // navigator.geolocation.getCurrentPosition(function(pos) {
  //     map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
  // });
  $scope.map = map;
})

.controller('DashDetailCtrl', function($scope, $stateParams, StopTime) {
  var stopTimes = StopTime.query({stop_id: $stateParams.stopId});
  $scope.stopTimes = stopTimes;

  setInterval(function(){
    $scope.$apply();
  }, 60000);
})


.controller('ChatsCtrl', function($scope, Route) {
  $scope.routes = [];
  $scope.query = '';
  // $scope.remove = function(chat) {
  //   Chats.remove(chat);
  // }
  $scope.search = function() {
    if ( this.query.length < 3 ) {
      $scope.routes = [];
    } else {
      Route.query({ q: this.query }, function(routes) {
        $scope.routes = routes;
      });
    }
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Trip) {
  $scope.trips = Trip.query({ route_id: $stateParams.routeId });
})

.controller('TripDetailCtrl', function($scope, $stateParams, StopTime) {
  $scope.stop_times = StopTime.query({ trip_id: $stateParams.tripId });
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
});


//TETETETTE

// .controller('MyCtrl', ['$scope', 'FlightDataService', function($scope, FlightDataService) {
//
// 	$scope.myTitle = 'Auto Complete Example';
//
//   $scope.data = { "airlines" : [], "search" : '' };
//
//   $scope.search = function() {
//
//   	FlightDataService.searchAirlines($scope.data.search).then(
//   		function(matches) {
//   			$scope.data.airlines = matches;
//   		}
//   	)
//   }
//
// }]);
