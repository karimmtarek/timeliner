class ContactMailerPreview
  def contact_form_email
    ContactMailer.contact_form_email(FactoryGirl.build(:user), message_params)
  end

  private

  def message_params
    {
      subject: 'Hello world!',
      email: 'karim@gmail.com',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius, leo a ullamcorper feugiat, ante purus sodales justo, a faucibus libero lacus a est. Aenean at mollis ipsum.'
    }
  end
end
