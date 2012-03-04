# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


Inspect = window.Inspect
window.MenuStates = {oma_plan_menu: 'hidden'}

toggle_plan_menu = (x) -> 
  if x == 'hidden'
    $('.oma_welcome_message').text("state is #{x}, setting it to visible")
    return window.MenuStates.oma_plan_menu = 'visible'
  else
    $('.oma_welcome_message').text("state is #{x}, setting it to hidden")
    return window.MenuStates.oma_plan_menu = 'hidden'
  return

#
# Setup (i.e. bind) for :click and :onmouseover events
#
$(document).ready ->

  $('#home').bind 'click', ->
    $('.oma_welcome_message').text('You clicked Home, wonder where that is?')

  $('#home').bind 'mouseover', ->
    $('.oma_welcome_message').text("you did a mouseover on Home!")

  $('#plan').bind 'click', -> 
    $('.oma_welcome_message').text('You clicked Plan (nice one).')
    if window.MenuStates.oma_plan_menu == 'hidden'
      toggle_plan_menu(window.MenuStates.oma_plan_menu)
      $('#oma_plan_menu').show() 
      $('#snapshot').show()
      $('#plan_by_format').show()
    else
      toggle_plan_menu(window.MenuStates.oma_plan_menu)
      $('#oma_plan_menu').hide()
      $('#snapshot').hide()
      $('#plan_by_format').hide()
    stopImmediatePropagation()
    return
    
  $('#plan').bind 'mouseover', ->
    $('.oma_welcome_message').text("You moused over Plan!")
	
  $('#snapshot').bind 'click', ->
    $('.oma_welcome_message').text('Snapshot.  WHAT IS THIS CONTENT?  WE CAN DO A ONE PAGE UI RIGHT HERE')

  $('#plan_by_format').bind 'click', ->
    $('.oma_welcome_message').text('Plan By Format.  What ROUTE to this conent?')

  $('#buy').bind 'mouseover', ->
    $('.oma_welcome_message').text('Buy using MOVE AMS,  logon required.')

  $('#learn').bind 'mouseover', ->
    $('.oma_welcome_message').text('Learn using MOVE AMS, logon required. Not implemented this release.')

  $('#proof').bind 'mouseover', ->
    $('#oma_welcome_message').text('Proof using MOVE AMS, logon required. Not implemented this release.')

  $('#contact').bind 'mouseover', ->
    $('.oma_welcome_message').text('Contact OMA using href=\'http://moveoutdoor.com.au/contact-us')
  
