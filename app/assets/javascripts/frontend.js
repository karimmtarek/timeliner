//= require jquery
//= require jquery_ujs
//= require frontend/wow.min
//= require frontend/ddscrollspy

new WOW().init();


jQuery(function($){

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
});

