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

    visualizaciones =
      parent: app
      name: 'app.visualizaciones'
      url: '/visualizaciones'
      views:
        "mainContent":
          templateUrl: 'app/main/visualizaciones.html'

    $stateProvider.state app
    $stateProvider.state home
    $stateProvider.state productos
    $stateProvider.state disponibles
    $stateProvider.state visualizaciones

    $urlRouterProvider.otherwise '/app/home'
