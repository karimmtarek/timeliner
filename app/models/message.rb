class Message
  def initialize(message_params)
    @email = message_params[:email]
    @subject = message_params[:subject]
    @body = message_params[:body]
  end
end
