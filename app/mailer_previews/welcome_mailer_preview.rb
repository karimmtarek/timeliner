class WelcomeMailerPreview
  def welcome_email
    WelcomeMailer.welcome_email FactoryGirl.build(:user)
  end
end
