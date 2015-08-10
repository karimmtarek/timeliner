class SocialMediaLink < ActiveRecord::Base
  belongs_to :user

  ALLOWED_SITES = ['LinkedIn', 'Twitter', 'GitHub', 'Stack Overflow', 'Dribble', 'Behance']
end
