// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// $(document).ready(function(){
// new google.maps.places.Autocomplete(
//   (document.getElementById('autocomplete')), {
//     types: ['geocode']
//   });

// })


// function initAutocomplete() {
//         var map = new google.maps.Map(document.getElementById('map'), {
//           center: {lat: -33.8688, lng: 151.2195},
//           zoom: 13,
//           mapTypeId: 'roadmap'
//         });

//       var input = document.getElementById('pac-input');
//       var searchBox = new google.maps.places.SearchBox(input);
//       map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

//       map.addListener('bounds_changed', function() {
//       searchBox.setBounds(map.getBounds());
//         });

//        var markers = [];
//         // Listen for the event fired when the user selects a prediction and retrieve
//         // more details for that place.
//         searchBox.addListener('places_changed', function() {
//           var places = searchBox.getPlaces();

//           if (places.length == 0) {
//             return;
//           }
//            // Clear out the old markers.
//           markers.forEach(function(marker) {
//             marker.setMap(null);
//           });
//           markers = [];

//           var bounds = new google.maps.LatLngBounds();
//           places.forEach(function(place) {
//             if (!place.geometry) {
//               console.log("Returned place contains no geometry");
//               return;
//             }
//             var icon = {
//               url: place.icon,
//               size: new google.maps.Size(71, 71),
//               origin: new google.maps.Point(0, 0),
//               anchor: new google.maps.Point(17, 34),
//               scaledSize: new google.maps.Size(25, 25)
//             };

//               markers.push(new google.maps.Marker({
//               map: map,
//               icon: icon,
//               title: place.name,
//               position: place.geometry.location
//             }));
//               if (place.geometry.viewport) {
//               // Only geocodes have viewport.
//               bounds.union(place.geometry.viewport);
//             } else {
//               bounds.extend(place.geometry.location);
//             }
//           });
//           map.fitBounds(bounds);

//   $('#map').css('overflow', 'visible')
//       });
      }
  // google.maps.event.addDomListener(window, 'load', initAutocomplete);


