//= require jquery
//= require jquery_ujs
//= require frontend/wow.min
//= require frontend/ddscrollspy
//= require owl.carousel.min

new WOW().init();



function miniNav(){
  window.addEventListener('scroll', function(e){
    var distanceY = window.pageYOffset || document.documentElement.scrollTop,
      shrinkOn = 300,
      header = document.querySelector("header");

    if (distanceY > shrinkOn) {
      $('header').addClass('smaller');
    } else {
      if ($('header').addClass('smaller')) {
        $('header').removeClass('smaller');
      }
    }
  });
}

$(function($){
  miniNav();
  $('#nav').ddscrollSpy();

  var close_btn = $("button.overlay-close"),
      wrapper   = $(".wrapper"),
      overlay   = $(".overlay"),
      body      = $("body"),
      header    = $('header');

  console.log('header outerHeight', header.outerHeight());
  wrapper.css('padding-top', header.outerHeight());
  header.addClass('fixed');

  close_btn.on('click', function(e){
    overlay.removeClass('open').addClass('close');
    wrapper.removeClass('overlay-open');
    body.removeClass('noscroll');
    e.preventDefault();
  });

  $('.more_milestone_details').on('click', function(e){
    $(this).toggleClass('show')
           .siblings('.description')
           .slideToggle('fast', function(){
             if ($(this).siblings('.btn').hasClass('show')){
               $(this).siblings('.btn').text('less details');
             } else {
               $(this).siblings('.btn').text('more details');
             }
           });
    e.preventDefault();
  });
});

