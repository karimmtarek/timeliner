class ContactMailer < ApplicationMailer

  def contact_form_email(user, sender_email, body)
    @user = user
    @sender_email = sender_email
    @message_body = body
    mail(from: @sender_email,
         to: @user.email,
         subject: "You just got a message! through Timeliner.",
         template_path: 'contact_mailer',
         template_name: 'contact_form_email'
        )
  end

end
