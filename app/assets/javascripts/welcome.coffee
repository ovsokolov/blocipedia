# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@signUp = () ->
  plan = $('#premium_plan').is(':checked');
  url = '/users/sign_up?premium_plan=' + plan
  window.location.href = url


window["signUp"] = signUp
