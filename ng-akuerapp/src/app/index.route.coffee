angular.module 'akuerapp'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
    
    # Main Menu state
    app =
      name: 'app'
      url: '/app'
      abstract: true
      template: '<menu-nav></menu-nav>'
      controller: 'AppCtrl'

    home =
      parent: app,
      name: 'app.home'
      url: '/home'
      views:
        "menuContent":
          template: '<home-page></home-page>'
          controller: 'HomeCtrl'

    $urlRouterProvider.otherwise '/app/home'
