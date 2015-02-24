class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin]
  has_many :milestones

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email       = auth.info.email
      user.password    = Devise.friendly_token[0,20]
      user.username    = auth.info.name
      user.image       = auth.info.image
      user.first_name  = auth.info.first_name
      user.last_name   = auth.info.last_name
      user.location    = auth.info.location
      user.description = auth.info.description
      user.phone       = auth.info.phone
    end
  end

  #  def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
end
