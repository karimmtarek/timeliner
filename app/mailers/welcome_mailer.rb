class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @preheader_text = 'Thank you for giving Timeliner a shot, we are really excited to have you.'
    mail(to: @user.email,
         subject: 'Welcome to Timeliner',
         template_path: 'emails',
         template_name: 'welcome_email'
        )
  end
end
