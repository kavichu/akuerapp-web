angular.module "akuerapp"
  .controller "ProductosController", ($scope, Producto) ->
    Producto.query().then (productos) -> 
      $scope.productos = productos
