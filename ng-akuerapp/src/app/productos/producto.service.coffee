angular.module 'akuerapp'
  .factory 'Producto', ($log, $http, RailsResource) ->
    'ngInject'
    class Producto extends RailsResource
      @configure url: "/api/productos", name: "producto"
