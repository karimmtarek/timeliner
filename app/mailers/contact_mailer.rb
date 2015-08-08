class ContactMailer < ApplicationMailer
  def contact_form_email(user, message_params)
    @user = user
    @sender_email = message_params[:email]
    @message_subject = message_params[:subject]
    @message_body = message_params[:body]
    mail(from: @sender_email,
         to: @user.email,
         subject: @message_subject || "You just got message ##{@user.message_counter} through Timeliner.",
         template_path: 'emails',
         template_name: 'contact_form_email'
        )
  end
end
