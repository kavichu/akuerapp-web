angular.module 'akuerapp'
  .directive 'home', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/home/home.html'
      controller: "HomeController"
      bindToController: true
