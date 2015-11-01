angular.module 'akuerapp'
  .factory 'Disponible', ($log, $http, RailsResource) ->
    'ngInject'
    class Disponible extends RailsResource
      @configure url: "/api/disponibles", name: "disponible"
