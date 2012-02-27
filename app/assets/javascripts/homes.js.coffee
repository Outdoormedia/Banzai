# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#  jQuery ->
#  $("#oma_snapshot_sub-menu_item").blur ->
#      $("#oma_snapshot_sub-menu_item").text("Invalid credit card number.")


$(document).ready ->
  $('#test').bind 'click', ->
    alert 'You clicked Test!'

  $('#test').bind 'mouseover', ->
    alert 'you did a mouseover on Test!'

  $('#home').bind 'mouseover', ->
    alert 'you did a mouseover on Home!'