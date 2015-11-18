angular.module 'akuerapp'
  .factory 'Establecimiento', ($log, $http, RailsResource) ->
    'ngInject'
    class Establecimiento extends RailsResource
      @configure url: "/api/establecimientos", name: "establecimiento"
