'use strict'

###*
 # @ngdoc function
 # @name nccgElieApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the nccgElieApp
###
angular.module 'nccgElieApp'
  .controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->
    $scope.customers = []
    $scope.orderByDirection = ''
    $scope.orderByColumn = 'name'
    $scope.searchValue = ''

    $http.get('/customers.json').success (data) ->
      for c in data
        c.dob = new Date(c.dob)
        $scope.customers.push(c)

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

    $scope.setOrderBy = (column) ->
      if $scope.orderByColumn == column
        if $scope.orderByDirection == '-'
          $scope.orderByDirection = ''
        else
          $scope.orderByDirection = '-'
      $scope.orderByColumn = column

    ]
