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
         :validatable

  has_many :milestones, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true

  has_many :social_media_links, dependent: :destroy
  accepts_nested_attributes_for :social_media_links, allow_destroy: true

  friendly_id :username, use: :slugged

  # before_create :generate_username

  private

  def generate_username
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
