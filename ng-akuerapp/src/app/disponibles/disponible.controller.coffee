angular.module "akuerapp"
  .controller "DisponiblesController", ($scope, Disponible) ->
    Disponible.query().then (disponibles) ->
      $scope.gridOptions.data = disponibles

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
