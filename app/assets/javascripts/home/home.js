angular.module('HOVDirection.Home', [
  'ui.router', 
  'templates',
  'ngMaterial',
  'ngMdIcons'
])

  .config(['$stateProvider', function($stateProvider){
  $stateProvider

    .state('hovdirection.landing',{
    url: '/',
    views: {
      'main@': { // target the 'main' ng-view directive
        controller: 'LandingPageCtrl as landingPageCtrl',
        templateUrl: 'home/home.tmpl.html'
      }
    }
  })
}])

// Landing page controller
  .controller('LandingPageCtrl', ['$mdDialog', '$window', function ($mdDialog, $window){
  var landingPageCtrl = this;

  landingPageCtrl.appName = "HOVDirection"; 
}])
;