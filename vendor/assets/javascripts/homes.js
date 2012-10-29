
$(function() {

  $('#side_menu ul').mouseover(function() {
    $(this).find('> ul').slideToggle('fast'); 
  });

}