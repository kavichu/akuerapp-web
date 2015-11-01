angular.module 'akuerapp'
  .controller 'GeoNavController', ($rootScope, $scope, $timeout, webDevTec, toastr, Establecimiento) ->
    'ngInject'

    $scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 }

    $scope.findNearby = ->
      console.log "I am here!"
      return

    $scope.location = ''
  
    $scope.search = (lat, lon, distance)->
      console.log lat + ", " + lon + " - " + distance
      Establecimiento.$get('/api/establecimientos', {"lat": lat, "lon": lon, "distancia": distance}).then (establecimientos) ->
        $scope.establecimientos = establecimientos
        console.log establecimientos
        

      return
