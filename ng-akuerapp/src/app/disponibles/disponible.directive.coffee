angular.module 'akuerapp'
  .directive 'disponibleList', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/disponibles/disponiblelist.html'
      controller: "DisponiblesController"
      bindToController: true
