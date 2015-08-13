class GoodbyeMailer < ApplicationMailer
  def goodbye_email(user)
    @user = user
    @preheader_text = "Sorry to see you go, you'll be missed!"
    mail(to: @user.email,
         subject: '[Timeliner] Sorry to see you go',
         template_path: 'emails',
         template_name: 'goodbye_email'
        )
  end
end
