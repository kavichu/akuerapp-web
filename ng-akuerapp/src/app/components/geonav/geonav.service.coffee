angular.module 'akuerapp'
  .service 'MapData', ($rootScope) ->
    'ngInject'
    
    $rootScope.distanciaSlider = 5

    $rootScope.map =
      center:
        latitude: -25.2961916
        longitude: -57.616991299999995
      zoom: 8
      control: new Object()
      markers: []
    
    $rootScope.circle =
      id: 1
      center: 
        latitude: -25.2961916
        longitude: -57.616991299999995
      radius: $rootScope.distanciaSlider * 1000
      visible: true
      stroke:
        color: '#08B21F',
        weight: 2,
        opacity: 1
      fill:
        color: '#08B21F',
        opacity: 0.5

    service =
      map: $rootScope.map
      circle: $rootScope.circle
      distanciaSlider: $rootScope.distanciaSlider

    return service
