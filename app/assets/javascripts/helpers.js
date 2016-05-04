new WOW().init();

function miniNav(){
  window.addEventListener('scroll', function(){
    var distanceY = window.pageYOffset || document.documentElement.scrollTop,
      shrinkOn = 300,
      header = document.querySelector('header');

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
  setTimeout(function(){ $('.flash').fadeOut('slow'); }, 3000);

  miniNav();
  $('#nav').ddscrollSpy({
    scrolltopoffset: -70
  });

  var closeBtn = $('button.overlay-close'),
      wrapper   = $('.wrapper'),
      overlay   = $('.overlay'),
      body      = $('body'),
      header    = $('header');


  function showNav(){
    header.slideDown('fast');
  }

  wrapper.css('padding-top', header.outerHeight());
  header.addClass('fixed');

  closeBtn.on('click', function(e){
    overlay.removeClass('open').addClass('close');
    wrapper.removeClass('overlay-open');
    body.removeClass('noscroll');
    window.setTimeout(showNav, 500);
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

  $('#show-milestones').on('click', function(e){
    e.preventDefault();
    $('#show-milestones').fadeOut();
    $('.event').removeClass('hide');
  });
});

