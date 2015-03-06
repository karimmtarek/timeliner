class ContactMailer < ApplicationMailer

  def contact_form_email(user, sender_name, sender_email, body)
    @user = user
    @sender_name = sender_name
    @sender_email = sender_email
    @message_body = body
    mail(from: @sender_email,
         to: @user.email,
         subject: "#{@sender_name}, send you a message!",
         template_path: 'contact_mailer',
         template_name: 'contact_form_email'
        )
  end

end
