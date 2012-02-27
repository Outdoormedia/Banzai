# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#  jQuery ->
#  $("#oma_snapshot_sub-menu_item").blur ->
#      $("#oma_snapshot_sub-menu_item").text("Invalid credit card number.")


#
# Setup (i.e. bind) events
#
$(document).ready ->
  $('#home').bind 'click', ->
    alert 'You clicked Home!'

  $('#home').bind 'mouseover', ->
    alert 'you did a mouseover on Home!'

  $('#plan').bind 'click', ->
    $('#oma_snapshot_sub-menu_item').toggle()
    $('#oma_plan-by-format_sub-menu_item').toggle()

  $('#buy').bind 'click', ->
    alert 'MOVE AMS tabs with logon required.'

  $('#learn').bind 'click', ->
    alert 'Not implemented this release.'

  $('#proof').bind 'click', ->
   alert 'Not implemented this release.'

  $('#oma_snapshot_sub-menu_item').bind 'click', ->
   alert 'Snapshot.'

  $('#oma_plan-by-format_sub-menu_item').bind 'click', ->
    alert 'Plan by format.'
