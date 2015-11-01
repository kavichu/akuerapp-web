angular.module 'akuerapp'
  .controller 'GeoNavController', ($rootScope, $scope, $timeout, webDevTec, toastr, Establecimiento, uiGmapGoogleMapApi, uiGmapIsReady) ->
    'ngInject'


    uiGmapGoogleMapApi.then (maps)->
      $scope.map =
        center:
          latitude: -25.2961916
          longitude: -57.616991299999995
        zoom: 8
        control: new Object()
        markers: []
      console.log("uiGmapGoogleMapApi.then")
      console.log($scope.map)

      $scope.marker =
        id: 0
        coords:
          latitude: -25.2961916
          longitude: -57.616991299999995
        options:
          draggable: false
    
      uiGmapIsReady.promise(1).then (instances) ->
        instances.forEach (inst) ->
          $scope.mapBkp = inst.map
          uuid = $scope.mapBkp.uiGmap_id
          mapInstanceNumber = inst.instance
          console.log($scope.mapBkp)

    $scope.location = ''

    $scope.search = (lat, lon, distance)->
      console.log lat + ", " + lon + " - " + distance
      Establecimiento.$get('/api/establecimientos', {"lat": lat, "lon": lon, "distancia": distance}).then (establecimientos) ->

        uiGmapGoogleMapApi.then (maps)->
          map = $scope.map.control.getGMap()
          map.panTo(new maps.LatLng(lat, lon))
          $scope.marker =
              coords:
                latitude: lat
                longitude: lon
          # establecimientos.each (data) ->
          $scope.map.markers = []
          for e in establecimientos
            m =
              id: $scope.map.markers.length + 1
              latitude: e["latitud"]
              longitude: e["longitud"]
              options:
                draggable: false
            $scope.map.markers.push m
            console.log(m) 
          console.log(typeof(establecimientos))

        # $scope.map.center =
        #   latitude: lat
        #   longitude: lon
        # $scope.marker.coords =
        #   latitude: lat
        #   longitude: lon

        # console.log ("search -> $scope.map")
        # console.log ($scope.map)
        $scope.establecimientos = establecimientos
        # console.log establecimientos


      return
