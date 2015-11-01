angular.module 'akuerapp'
  .controller 'HomeController', ($scope, $timeout, webDevTec, toastr, Establecimiento, uiGmapGoogleMapApi) ->
    'ngInject'
    $scope.establecimientos = []
    Establecimiento.$get('/api/establecimientos',{"location": $scope.location}).then (establecimientos) ->
      $scope.establecimientos = establecimientos
      uiGmapGoogleMapApi.then (maps)->
        # $scope.map =
        #   center:
        #     latitude: -25.2961916
        #     longitude: -57.616991299999995
        #   zoom: 8
        #   control: new Object()
        #   markers: []
        for e in establecimientos
          m =
            id: $scope.map.markers.length + 1
            latitude: e["latitud"]
            longitude: e["longitud"]
            options:
              draggable: false
          $scope.map.markers.push m
        map = $scope.map.control.getGMap()
        # map.bounds
        latLonBounds = new maps.LatLngBounds()
        for e in $scope.map.markers
          # console.log(e)
          lat = e["latitude"]
          lon = e["longitude"]
          console.log(lat)
          console.log(lon)
          if lat && lon
            latLng = new maps.LatLng(lat, lon)
            latLonBounds.extend(latLng)
        map.setCenter(latLonBounds.getCenter())
        map.fitBounds(latLonBounds)
        map.setZoom(12)
        # console.log(m) 

    return
