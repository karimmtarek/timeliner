Document.ready? do

  ele = Element['.message .close']
  ele.on :click do
    ele.closest('.message').effect(:slide_up)
  end

end

