class MessageCenter
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def notify_contact_request(message, listener)
    ContactMailer.contact_form_email(user, message).deliver_now
    listener.message_sent
  end
end
