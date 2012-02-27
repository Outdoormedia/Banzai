# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#  jQuery ->
#  $("#oma_snapshot_sub-menu_item").blur ->
#      $("#oma_snapshot_sub-menu_item").text("Invalid credit card number.")


#
# Setup (i.e. bind) for :click and :onmouseover events
#
$(document).ready ->
  $('#home').bind 'click', ->
    alert 'You clicked Home!'

  $('#home').bind 'mouseover', ->
    $('.oma_welcome_message').text("you did a mouseover on Home!")

  $('#plan').bind 'click', ->
    $('#oma_snapshot_sub-menu_item').toggle()
    $('#oma_plan-by-format_sub-menu_item').toggle()

  $('#oma_snapshot_sub-menu_item').bind 'click', ->
    $('.oma_welcome_message').text("Snapshot content here.")

  $('#buy').bind 'click', ->
    $('.oma_welcome_message').text('MOVE AMS tabs with logon required.')

  $('#learn').bind 'click', ->
    $('.oma_welcome_message').text('MOVE AMS tabs with logon required. Not implemented this release.')

  $('#proof').bind 'click', ->
    $('.oma_welcome_message').text('Proof AMS tabs with logon required. Not implemented this release.')

  $('#oma_snapshot_sub-menu_item').bind 'click', ->
    $('.oma_welcome_message').text('Snapshot.  WHAT IS THIS CONTENT?  WE CAN DO A ONE PAGE UI RIGHT HERE')

  $('#oma_plan-by-format_sub-menu_item').bind 'click', ->
    $('.oma_welcome_message').text('Plan By Format.  What ROUTE to this conent?')
