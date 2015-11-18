angular.module 'akuerapp'
  .controller 'GeoNavController', ($rootScope, $scope, $timeout, webDevTec, toastr, Establecimiento, uiGmapGoogleMapApi, uiGmapIsReady, MapData) ->
    'ngInject'

    $scope.distanciaSlider = MapData.distanciaSlider
    $scope.$on "slideEnded", () ->
      $scope.circle.radius = $scope.distanciaSlider * 1000
      $scope.circle.center = $scope.map.center
      $scope.search($scope.map.center.latitude, $scope.map.center.longitude, $scope.distanciaSlider)

      $scope.windowOptions =
        visible: false

      $scope.onClick = ()->
        $scope.windowOptions.visible = !$scope.windowOptions.visible

      $scope.closeClick = () ->
        $scope.windowOptions.visible = false

    uiGmapGoogleMapApi.then (maps)->
      $scope.map = MapData.map
      $scope.circle = MapData.circle
      # $scope.map =
      #   center:
      #     latitude: -25.2961916
      #     longitude: -57.616991299999995
      #   zoom: 8
      #   control: new Object()
      #   markers: []

      # $scope.map = $scope.map
      
      # $scope.circle =
      #   id: 1
      #   center:
      #     latitude: -25.2961916
      #     longitude: -57.616991299999995
      #   radius: $scope.distanciaSlider * 1000
      #   visible: true
      #   stroke:
      #     color: '#08B21F',
      #     weight: 2,
      #     opacity: 1
      #   fill:
      #     color: '#08B21F',
      #     opacity: 0.5
      console.log($scope.circle)

    $scope.location = ''

    
    
    $scope.search = (lat, lon, distance)->
      distance = distance * 1000
      Establecimiento.$get('/api/establecimientos', {"lat": lat, "lon": lon, "distancia": distance}).then (establecimientos) ->
        $scope.establecimientos = establecimientos
        uiGmapGoogleMapApi.then (maps)->
          map = $scope.map.control.getGMap()
          map.panTo(new maps.LatLng(lat, lon))
          $scope.map.markers = []
          MapData.map.markers = []
          for e in establecimientos
            m =
              id: $scope.map.markers.length + 1
              latitude: e["latitud"]
              longitude: e["longitud"]
              options:
                draggable: false
              # nombre: e["nombre"]
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
