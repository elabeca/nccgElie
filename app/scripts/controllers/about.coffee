'use strict'

###*
 # @ngdoc function
 # @name nccgElieApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the nccgElieApp
###
angular.module 'nccgElieApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
