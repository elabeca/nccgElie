'use strict'

###*
 # @ngdoc function
 # @name nccgElieApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the nccgElieApp
###
angular.module 'nccgElieApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
