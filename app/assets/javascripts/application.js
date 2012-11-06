// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require pieChart
//= require_self

Site = {
  init: function() {
    this.startPjax();
    this.enableSideMenuMouseFocus();
  },

  startPjax: function() {
    $.pjax.defaults.scrollTo = false; // Disable scrolling-to-top on each link click

    $link = $('nav#side_menu a');
    $link.pjax('[data-pjax-container]');
    $link.click(function(e) {
      $('nav#side_menu li.current').removeClass('current');
      $(this).parent().addClass('current');
    });
  },

  enableSideMenuMouseFocus: function() {
    $('#side_menu ul li a').mouseover(function() {
      $(this).parent('li').find('> ul').stop(true).slideDown('fast');
      return false;
    });

    $('#side_menu ul li').mouseleave(function() {
      $(this).find('> ul').stop(true).slideUp('fast');
      return false;
    });

  }
}

$(function() {
  site = Site.init();

});
