class SocialMediaLink < ActiveRecord::Base
  belongs_to :user

  ALLOWED_SITES = ['linkedin', 'twitter', 'github', 'stack overflow', 'dribble', 'behance']
end
