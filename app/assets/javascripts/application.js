//= require jquery
//= require jquery_ujs

//= require nested_form_fields

$(document).ready(function () {

  $("#present").change(function(){
    $("#end_date").toggleClass("hide");
  });

  $('.form-control').focusin(function() {
    $(this).parent().addClass('show-icon');
  });

  $('.form-control').focusout(function() {
    $(this).parent().removeClass('show-icon');
  });

  setTimeout(function(){ $('.flash').fadeOut('slow'); }, 3000);

  $('.alert-close').on('click', function(e){
    e.preventDefault();
    $(this).closest('.alert').fadeOut('slow');
  });

  // $('.switch').on('click', function(){
  //   if ($(this).hasClass('on')) {
  //     $(this).addClass('off');
  //     $(this).removeClass('on');
  //     $(this).siblings('.note').text("Your timeline is invisible, as long as you loged-in you still can see it, though everyone else can't.");
  //   } else {
  //     $(this).addClass('on');
  //     $(this).removeClass('off');
  //     $(this).siblings('.note').text("Your timeline is visible to the whole world.");
  //   }
  // });

  // setTimeout(function(){
  //   $('.flash').addClass('animated bounceOutRight');
  // }, 3000);

  console.log('window: ', $(window).height());
  console.log('header: ', $('.header').outerHeight());
  console.log('footer: ', $('.footer').outerHeight());
  var getHeight = $(window).height() - ($('.header').outerHeight() + $('.footer').outerHeight()) - 50;

  function fixHeight(){
    $('.app-main.body').css("min-height", getHeight);
  }

  fixHeight();

  $('window').resize(function() {
    fixHeight();
  });
});



