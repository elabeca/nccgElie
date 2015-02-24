'use strict'

###*
 # @ngdoc function
 # @name nccgElieApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the nccgElieApp
###
angular.module 'nccgElieApp'
  .controller 'MainCtrl', ['$scope', ($scope) ->
    $scope.customers = []

    initCustomer = ->
      $scope.customer = {}
      $scope.customer.numOfChildren = 0

    $scope.setNumOfChildren = (customer, numOfChildren) ->
      customer.numOfChildren = numOfChildren

    $scope.addCustomer = =>
      $scope.customers.push($scope.customer)
      initCustomer()

    $scope.deleteCustomers = () ->
      $scope.customers = _.reject $scope.customers, (c) ->
                            c? and c.isSelected? and c.isSelected

    $scope.setEditMode = (customer, isEditing) ->
      customer.isEditing = isEditing

    ]
