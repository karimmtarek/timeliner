//= require jquery
//= require jquery_ujs

//= require nested_form_fields

$(document).ready(function () {

  $("#present").change(function(){
    $("#end_date").toggleClass("hide");
  });

  // setTimeout(function(){ $('.flash').fadeOut('slow'); }, 3000);
});



