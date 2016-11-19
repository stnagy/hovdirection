(function(){
  
  var directionFactory = function($http){
    var factory = {};
    factory.getDirection = function(){
      return $http.get('api/direction');
    };
    return factory;
  };
    
  directionFactory.$inject = ['$http'];
  
  angular.module('HOVDirection').factory('directionFactory', directionFactory);
  
}());