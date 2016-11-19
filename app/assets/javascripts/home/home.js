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
  .controller('LandingPageCtrl', ['$mdDialog', '$window', '$log', 'directionFactory', function ($mdDialog, $window, $log, directionFactory){
  var landingPageCtrl = this;
  landingPageCtrl.appName = "HOVDirection"; 

  function init(){
    
    // get data for direction
    directionFactory.getDirection()
      .then(function(response) {
        landingPageCtrl.direction = response.data.direction;
      }, function(data, status) {
        $log.log(data.error + ' ' + status);
      });
    
  }
  
  init();
  
  
}])
;