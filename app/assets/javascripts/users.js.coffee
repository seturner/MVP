$(document).on "click", ".userlogin", ->
  $("#new_user_session").submit()

$(document).on "click", ".usersignup", ->
  $("#new_user").submit()

$(document).on "click", ".newpass", ->
  $("#new_pass").submit()

angular.module('Simmr').controller "UserRegisterCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]