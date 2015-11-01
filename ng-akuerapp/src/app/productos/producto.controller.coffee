angular.module "akuerapp"
  .controller "ProductosController", ($scope, Producto) ->
    Producto.query().then (productos) ->
      $scope.gridOptions.data = productos

    $scope.gridOptions =
      paginationPageSizes: [25, 50, 75]
      paginationPageSize: 25
      # columnDefs: [
      #   { name: 'name' },
      #   { name: 'gender' },
      #   { name: 'company' }
      # ]
      data: []

    $scope.gridOptions.onRegisterApi = (gridApi) ->
      $scope.gridApi = gridApi
