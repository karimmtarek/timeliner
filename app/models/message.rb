class Message
  attr_reader :user

  def initialize(email:, subject:, body:)
    @email = email
    @subject = subject
    @body = body
  end
end
