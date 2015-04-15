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
  // setTimeout(function(){ $('.flash').fadeOut('slow'); }, 3000);
});



