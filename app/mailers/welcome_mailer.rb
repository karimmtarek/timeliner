class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Welcome to Timeliner',
         template_path: 'emails',
         template_name: 'welcome_email'
        )
  end
end
