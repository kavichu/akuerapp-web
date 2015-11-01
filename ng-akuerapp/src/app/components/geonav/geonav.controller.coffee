angular.module 'akuerapp'
  .controller 'GeoNavController', ($rootScope, $scope, $timeout, webDevTec, toastr, Establecimiento) ->
    'ngInject'

    $scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 }

    $scope.findNearby = ->
      console.log "I am here!"
      return

    $scope.location = ''
  
    $scope.search = (location)->
      console.log location
      Establecimiento.$get('/api/establecimientos',{"location": location}).then (establecimientos) ->
        $scope.establecimientos = establecimientos
        console.log establecimientos

      return
