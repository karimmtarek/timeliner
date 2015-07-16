class User < ActiveRecord::Base
  extend FriendlyId
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :omniauth_providers => [:linkedin]
  has_many :milestones, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true

  has_many :social_media_links, dependent: :destroy
  accepts_nested_attributes_for :social_media_links, allow_destroy: true

  friendly_id :username, use: :slugged

  # before_create :generate_username_from_linkedin

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.access_key         = auth.extra.access_token.token
      user.access_secret      = auth.extra.access_token.secret
      user.email              = auth.info.email
      user.password           = Devise.friendly_token[0,20]
      user.username           = auth.info.name
      user.image              = auth.info.image
      user.first_name         = auth.info.first_name
      user.last_name          = auth.info.last_name
      user.location           = auth.info.location
      user.description        = auth.info.description
      user.phone              = auth.info.phone
      user.social_media_links.new(
        name: 'linkedin',
        url: auth.info.urls.public_profile
      )
      skills = auth.extra.raw_info.skills.values[1]
      skills.each do |skill_info|
        user.skills.new(name: skill_info.skill.name)
      end
    end
  end

  private

  def generate_username_from_linkedin
    username = self.username.gsub(' ', '-').downcase
    if User.where(username: username).exists?
      new_user_number = 1
      begin
        username = self.username.gsub(' ', '-').downcase + "-#{new_user_number}"
        new_user_number += 1
      end while User.where(username: username).exists?
    end
    self.username = username
  end

end
