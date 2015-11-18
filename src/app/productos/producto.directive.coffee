angular.module 'akuerapp'
  .directive 'productoList', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/productos/productolist.html'
      controller: "ProductosController"
      bindToController: true
