angular.module "akuerapp"
  .controller "ProductosController", ($scope, Producto, uiGridConstants) ->
    Producto.query().then (productos) ->
      $scope.gridOptions.data = productos

    $scope.gridOptions =
      enableFiltering: true
      paginationPageSizes: [25, 50, 75]
      paginationPageSize: 50

      data: []

    $scope.gridOptions.onRegisterApi = (gridApi) ->
      $scope.gridApi = gridApi
