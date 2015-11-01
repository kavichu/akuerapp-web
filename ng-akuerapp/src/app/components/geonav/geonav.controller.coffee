angular.module 'akuerapp'
  .controller 'GeoNavController', ($rootScope, $scope, $timeout, webDevTec, toastr) ->
    'ngInject'

    $scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 }

    $scope.findNearby = ->
      console.log "I am here!"
      return
    return
