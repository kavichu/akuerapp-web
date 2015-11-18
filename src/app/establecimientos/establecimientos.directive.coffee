angular.module 'akuerapp'
  .directive 'establecimientoList', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/establecimientos/establecimientolist.html'
      controller: "DisponiblesController"
      bindToController: true
