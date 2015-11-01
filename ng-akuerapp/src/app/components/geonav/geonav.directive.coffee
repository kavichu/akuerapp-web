angular.module 'akuerapp'
  .directive 'geoNav', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/geonav/geonav.html'
      controller: "GeoNavController"
      bindToController: true

  .directive 'googlePlaces', ->
    directive =
        restrict: 'E'
        replace: true
        # scope: {location: '=', search: '='},
        templateUrl: "app/components/geonav/googleplaces.html"
        link: ($scope, elm, attrs)->
          autocomplete = new google.maps.places.Autocomplete($("#google_places_ac")[0], {})
          google.maps.event.addListener autocomplete, 'place_changed', ->
            console.log("place_changed")
            place = autocomplete.getPlace()
            $scope.location = place.geometry.location.lat() + ',' + place.geometry.location.lng()
            lat = place.geometry.location.lat()
            lon = place.geometry.location.lng()
            $scope.search(lat, lon, $scope.distanciaSlider)
            $scope.$apply()
