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
      templateUrl: 'app/main/main.html'
      controller: 'MainController'

    home =
      parent: app
      name: 'app.home'
      url: '/home'
      views:
        "mainContent":
          template: '<home></home>'
          controller: 'HomeController'

    productos =
      parent: app
      name: 'app.productos'
      url: '/productos'
      views:
        "mainContent":
          template: '<producto-list></producto-list>'
          controller: 'ProductosController'

    disponibles =
      parent: app
      name: 'app.disponibles'
      url: '/disponibles'
      views:
        "mainContent":
          template: '<disponible-list></disponible-list>'
          controller: 'DisponiblesController'

    $stateProvider.state app
    $stateProvider.state home
    $stateProvider.state productos
    $stateProvider.state disponibles

    $urlRouterProvider.otherwise '/app/home'
