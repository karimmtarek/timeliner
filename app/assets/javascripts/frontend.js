//= require jquery
//= require jquery_ujs
//= require frontend/wow.min
//= require frontend/ddscrollspy
//= require owl.carousel.min

new WOW().init();


$(function($){

  $('#nav').ddscrollSpy();

  var close_btn = $("button.overlay-close"),
      wrapper   = $(".wrapper"),
      overlay   = $(".overlay"),
      body      = $("body");

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

