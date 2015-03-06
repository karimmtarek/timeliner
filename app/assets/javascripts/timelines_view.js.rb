Document.ready? do
  Element['.info-icon'].on :click do |event|
    event.prevent_default
    bubble_class = ".#{event.current_target.data('show')}"
    Element['.info-icon'].remove_class('active')
    event.current_target.add_class('active')

    Element[".about-bubble"].add_class('pb-30')

    Element['.about-bubble'].find('.show').remove_class('show')
    Element[".about-bubble"].find(bubble_class).add_class('show')

  end

  # nav_link = Element['header nav a']

  # nav_link.on :click do |event|

  #   Element['body'].animate({
  #     scrollTop: Element[event.current_target.data('scrollto')].offset().top
  #   }, 2000)

  #   false
  # end

  `$('#nav').ddscrollSpy();`

  `new WOW().init();`
end