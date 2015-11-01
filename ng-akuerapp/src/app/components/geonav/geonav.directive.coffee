angular.module 'akuerapp'
  .directive 'geoNav', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/geonav/geonav.html'
      controller: "GeoNavController"
      bindToController: true


