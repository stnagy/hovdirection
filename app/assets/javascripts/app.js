angular.module('HOVDirection', [
  'ui.router', // router
  'templates', // templates for rails
  'ngMaterial', // angular material -- done correctly
  'ngAnimate', // angular animations
  'HOVDirection.Home' // homepage
])

  .config([
    '$mdThemingProvider', 
    function($mdThemingProvider) {
      $mdThemingProvider.theme('default')
      .primaryPalette('light-blue', {
        'default': '700', // by default use shade 400 from the pink palette for primary intentions
        'hue-1': '100', // use shade 100 for the <code>md-hue-1</code> class
        'hue-2': '600', // use shade 600 for the <code>md-hue-2</code> class
        'hue-3': 'A100'
      })
      .accentPalette('red', {
        'default': '700', // by default use shade 400 from the pink palette for primary intentions
        'hue-1': '100', // use shade 100 for the <code>md-hue-1</code> class
        'hue-2': '600', // use shade 600 for the <code>md-hue-2</code> class
        'hue-3': 'A100' // use shade A100 for the <code>md-hue-3</code> class
      });
  }])

  .config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('hovdirection', {
      url: '',
      abstract: 'true'
    });

    $urlRouterProvider.otherwise('/');
  }])
  
  .config(['$locationProvider', function($locationProvider) {
    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    });
  }])

;
