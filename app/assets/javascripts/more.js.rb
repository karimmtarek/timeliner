Document.ready? do

  more_btn = Element[".more"]



  more_btn.on :click do |event|
    description = event.current_target.prev()

    # description.toggle_class('hide')

    final_height = 0
    description.children.each do |x|
      final_height += x.outer_height(true)
    end
    puts final_height

    if description.has_class? ('hide')
      description.css({:height => final_height, :opacity => 1}).remove_class('hide')
      event.current_target.text('less details')
    else
      description.css({:height => 0, :opacity => 0}).add_class('hide')
      event.current_target.text('more details')
    end

    false

  end

end