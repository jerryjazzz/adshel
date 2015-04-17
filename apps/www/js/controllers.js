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
          infoWindow.setContent(stops[i]['stop_name']);
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

.controller('ChatsCtrl', function($scope, Chats) {
  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
});
