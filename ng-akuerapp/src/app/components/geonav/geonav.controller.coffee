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

      # $scope.marker =
      #   id: 0
      #   coords:
      #     latitude: -25.2961916
      #     longitude: -57.616991299999995
      #   options:
      #     draggable: false
    
      uiGmapIsReady.promise(1).then (instances) ->
        instances.forEach (inst) ->
          $scope.mapBkp = inst.map
          uuid = $scope.mapBkp.uiGmap_id
          mapInstanceNumber = inst.instance
          console.log("uiGmapIsReady")
          console.log($scope.mapBkp)

    $scope.location = ''

    $scope.search = (lat, lon, distance)->
      console.log lat + ", " + lon + " - " + distance
      Establecimiento.$get('/api/establecimientos', {"lat": lat, "lon": lon, "distancia": distance}).then (establecimientos) ->
        $scope.establecimientos = establecimientos
        uiGmapGoogleMapApi.then (maps)->
          map = $scope.map.control.getGMap()
          map.panTo(new maps.LatLng(lat, lon), 5)
          # $scope.marker =
          #     coords:
          #       latitude: lat
          #       longitude: lon
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
          console.log($scope.map.markers)
          console.log(typeof(establecimientos))

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
          if $scope.map.markers.length > 0
            map.setCenter(latLonBounds.getCenter())
            map.fitBounds(latLonBounds)
          # map.setZoom(12)  
        # console.log establecimientos


      return
