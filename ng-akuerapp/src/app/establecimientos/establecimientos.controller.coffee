angular.module "akuerapp"
  .controller "EstablecientosController", ($scope, Establecimiento) ->
    Establecimiento.query().then (establecimientos) ->
      $scope.gridOptions.data = establecimientos

    $scope.gridOptions =
      paginationPageSizes: [25, 50, 75]
      paginationPageSize: 25
      data: []

    $scope.gridOptions.onRegisterApi = (gridApi) ->
      $scope.gridApi = gridApi
