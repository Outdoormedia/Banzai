# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Vestigial, to be removed when example not useful...
#Inspect = window.Inspect
#window.MenuStates = {oma_plan_menu: 'hidden'}
#toggle_plan_menu = (x) -> 
#  if x == 'hidden'
#    return window.MenuStates.oma_plan_menu = 'visible'
#  else
#    return window.MenuStates.oma_plan_menu = 'hidden'
#  return


$(document).ready ->

  $('#oma_promo_panel').bind 'mouseover', ->
    $('#oma_welcome_message').text('You moused over Promo Panel!')

  $('#oma_promo_panel').bind 'click', ->
    $('#oma_welcome_message').text('Show a sidebar of things to learn about?!')

  $('#home').bind 'click', ->
    $('#oma_welcome_message').text('You clicked Home, wonder where that is?')

  $('#home').bind 'mouseover', ->
    $('#oma_welcome_message').text("you did a mouseover on Home!")

  $('#plan').bind 'click', -> 
    $('.oma_welcome_message').text('You clicked Plan (nice one).')
    $('#snapshot').toggle()
    $('#plan_by_format').toggle()
    $('#oma_plan_menu').toggle()    
    stopImmediatePropagation()
    
  $('#plan').bind 'mouseover', ->
    $('#oma_welcome_message').text("You moused over Plan! Try clicking it.")
	
  $('#snapshot').bind 'click', ->
    $('.oma_welcome_message').text('Snapshot.  WHAT IS THIS CONTENT?  WE CAN DO A ONE PAGE UI RIGHT HERE')
    $('#oma_ipso_laurem_panel').toggle()
    stopImmediatePropagation()

  $('#plan_by_format').bind 'click', ->
    $('.oma_welcome_message').text('Plan By Format.  What ROUTE to this conent?')
    $('#oma_ipso_laurem_cols_panel').toggle()
    stopImmediatePropagation()

  $('#buy').bind 'mouseover', ->
    $('#oma_welcome_message').text('Buy using MOVE AMS,  logon required.')

  $('#know').bind 'mouseover', ->
    $('#oma_welcome_message').text('Learn using MOVE AMS, logon required. Not implemented this release.')

  $('#contact').bind 'mouseover', ->
    $('#oma_welcome_message').text('Contact OMA using href=\'http://moveoutdoor.com.au/contact-us')
    $('#oma_diagonal_logo3').toggle()
    stopImmediatePropagation()
  
  $('#oma_diagonal_logo2').bind 'mouseover', ->
    $('#oma_diagonal_logo3').toggle()
    stopImmediatePropagation()

  $('#oma_diagonal_logo3').bind 'mouseover', ->
    $('#oma_diagonal_logo2').toggle()
    stopImmediatePropagation()

  $('#oma_grid').bind 'mouseover', ->
    $('#oma_welcome_message').text('We could make this runnable to illustrate concepts...')
    stopImmediatePropagation()
