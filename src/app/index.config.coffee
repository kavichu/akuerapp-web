angular.module 'akuerapp'
  .config ($logProvider, toastrConfig) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true

  .config (uiGmapGoogleMapApiProvider)->
    uiGmapGoogleMapApiProvider.configure {
    v: '3.20'
    libraries: 'weather,geometry,visualization'
    }
