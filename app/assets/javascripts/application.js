//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require nested_form_fields

$(document).ready(function () {

  $("#present").change(function(){
    $("#end_date").toggleClass("hide");
  });

  $("#available").change(function(){
    $("#availability_message").toggleClass("hide");
  });

  $('.form-control').focusin(function() {
    $(this).closest('.field-icon').addClass('show-icon');
  });

  $('.form-control').focusout(function() {
    $(this).closest('.field-icon').removeClass('show-icon');
  });

  setTimeout(function(){ $('.flash').fadeOut('slow'); }, 3000);

  $('.alert-close').on('click', function(e){
    e.preventDefault();
    $(this).closest('.alert').fadeOut('slow');
  });

  console.log('window: ', $(window).height());
  console.log('header: ', $('.header').outerHeight());
  console.log('footer: ', $('.footer').outerHeight());
  var getHeight = $(window).height() - ($('.header').outerHeight() + $('.footer').outerHeight()) - 50;

  function fixHeight(){
    $('.app-main.body').css("min-height", getHeight);
  }

  fixHeight();

  // datepicker
  $('.date-select input').datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: "MM yy"
    });

});



