'use strict'

###*
 # @ngdoc function
 # @name nccgElieApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the nccgElieApp
###
angular.module 'nccgElieApp'
  .directive 'arrow', ->
    templateUrl: '/arrow.html'
    restrict: 'E'
    scope:
      column: '='
      direction: '='
      field: '@'
      title: '@'
    # template: "<span ng-show=\"column == '{{field}}' && direction == '-'\">&#9650;</span>
    #           <span ng-show=\"column == '{{field}}' && direction == ''\">&#9660;</span>
    #           {{title}}"
  .controller 'MainCtrl', ['$http', ($http) ->
    @customers = []
    @orderByDirection = ''
    @orderByColumn = 'name'
    @searchValue = ''

    $http.get('/customers.json').success (data) =>
      for c in data
        c.dob = new Date(c.dob)
        @customers.push(c)

    @initCustomer = =>
      @customer = {}
      @customer.numOfChildren = 0

    @setNumOfChildren = (customer, numOfChildren) ->
      customer.numOfChildren = numOfChildren

    @addCustomer = =>
      console.log "Customer: " + JSON.stringify(@customer)
      @customers.push(@customer)
      console.log "Customers: " + JSON.stringify(@customers)
      @initCustomer()

    @deleteCustomers = () ->
      @customers = _.reject @customers, (c) =>
                            c? and c.isSelected? and c.isSelected

    @setEditMode = (customer, isEditing) ->
      customer.isEditing = isEditing

    @setOrderBy = (column) =>
      if @orderByColumn == column
        if @orderByDirection == '-'
          @orderByDirection = ''
        else
          @orderByDirection = '-'
      @orderByColumn = column
  ]
