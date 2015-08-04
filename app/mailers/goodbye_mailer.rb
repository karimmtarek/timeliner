class GoodbyeMailer < ApplicationMailer
  def goodbye_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Hey! we are sorry!!!',
         template_path: 'emails',
         template_name: 'goodbye_email'
        )
  end
end
