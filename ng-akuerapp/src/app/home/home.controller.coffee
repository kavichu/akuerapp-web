angular.module 'akuerapp'
  .controller 'HomeController', ($scope, $timeout, webDevTec, toastr, Establecimiento, uiGmapGoogleMapApi) ->
    'ngInject'
    $scope.establecimientos = []
    Establecimiento.$get('/api/establecimientos',{"location": $scope.location}).then (establecimientos) ->
      $scope.establecimientos = establecimientos
      uiGmapGoogleMapApi.then (maps)->
        $scope.map.markers = []
        for e in establecimientos
          m =
            id: $scope.map.markers.length + 1
            latitude: e["latitud"]
            longitude: e["longitud"]
            options:
              draggable: false
          $scope.map.markers.push m
        # map = $scope.map.control.get
        # console.log(m) 

    return
