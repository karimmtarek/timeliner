class Milestone < ActiveRecord::Base
  belongs_to :user
  has_many :projects

  validates :title, presence: true
end
