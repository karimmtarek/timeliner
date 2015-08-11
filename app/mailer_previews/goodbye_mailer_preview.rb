class GoodbyeMailerPreview
  def goodbye_email
    GoodbyeMailer.goodbye_email FactoryGirl.build(:user)
  end
end
