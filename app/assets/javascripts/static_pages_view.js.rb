Document.ready? do

  # ele = Element['.message .close']
  # ele.on :click do
  #   ele.closest('.message').effect(:slide_up)
  # end

Element['.message .close'].on :click do |event|
  event.current_target.closest('.message').effect(:slide_up)
end

  `$('.ui.checkbox').checkbox();`
  `$('.ui.dropdown').dropdown({transition: 'drop', on: 'click'});`
  `$('.ui.accordion').accordion();`

end

