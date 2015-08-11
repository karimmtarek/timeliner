class ContactMailerPreview
  def contact_form_email
    ContactMailer.contact_form_email(FactoryGirl.build(:user), message_params)
  end

  private

  def message_params
    {
      subject: 'Hello world!',
      email: 'karim@gmail.com',
      body: 'this and that...'
    }
  end
end
