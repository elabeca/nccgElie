(function(){"use strict";angular.module("nccgElieApp",["ngAnimate","ngAria","ngCookies","ngMessages","ngResource","ngRoute","ngSanitize","ngTouch"]).config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/source",{templateUrl:"views/about.html",controller:"AboutCtrl"}).otherwise({redirectTo:"/"})}])}).call(this),function(){"use strict";angular.module("nccgElieApp").controller("MainCtrl",["$scope","$http",function(a,b){var c;return a.customers=[],a.orderByDirection="",a.orderByColumn="name",a.searchValue="",b.get("/customers.json").success(function(b){var c,d,e,f;for(f=[],d=0,e=b.length;e>d;d++)c=b[d],c.dob=new Date(c.dob),f.push(a.customers.push(c));return f}),c=function(){return a.customer={},a.customer.numOfChildren=0},a.setNumOfChildren=function(a,b){return a.numOfChildren=b},a.addCustomer=function(){return function(){return a.customers.push(a.customer),c()}}(this),a.deleteCustomers=function(){return a.customers=_.reject(a.customers,function(a){return null!=a&&null!=a.isSelected&&a.isSelected})},a.setEditMode=function(a,b){return a.isEditing=b},a.setOrderBy=function(b){return a.orderByColumn===b&&(a.orderByDirection="-"===a.orderByDirection?"":"-"),a.orderByColumn=b}}])}.call(this),function(){"use strict";angular.module("nccgElieApp").controller("AboutCtrl",["$scope",function(){}])}.call(this);