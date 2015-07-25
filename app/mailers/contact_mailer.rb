class ContactMailer < ApplicationMailer

  def contact_form_email(user, sender_email, subject, body)
    @user = user
    @sender_email = sender_email
    @message_subject = subject
    @message_body = body
    mail(from: @sender_email,
         to: @user.email,
         subject: @message_subject || "You just got message ##{@user.message_counter} through Timeliner.",
         template_path: 'contact_mailer',
         template_name: 'contact_form_email'
        )
  end

end
