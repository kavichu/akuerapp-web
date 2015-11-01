angular.module 'akuerapp'
  .controller 'HomeController', ($scope, $timeout, webDevTec, toastr, Establecimiento, uiGmapGoogleMapApi, MapData) ->
    'ngInject'
    $scope.establecimientos = []
    Establecimiento.$get('/api/establecimientos',{"location": $scope.location}).then (establecimientos) ->
      $scope.establecimientos = establecimientos
      uiGmapGoogleMapApi.then (maps)->
        $scope.map = MapData.map
        $scope.circle = MapData.circle
        for e in establecimientos
          m =
            id: e["id"]
            latitude: e["latitud"]
            longitude: e["longitud"]
            options:
              draggable: false
          $scope.map.markers.push m
        map = $scope.map.control.getGMap()
        latLonBounds = new maps.LatLngBounds()
        for e in $scope.map.markers
          lat = e["latitude"]
          lon = e["longitude"]
          if lat && lon
            latLng = new maps.LatLng(lat, lon)
            latLonBounds.extend(latLng)
        if $scope.map.markers.length > 0
          map.setCenter(latLonBounds.getCenter())
          map.fitBounds(latLonBounds)
    return
