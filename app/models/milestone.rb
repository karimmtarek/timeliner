class Milestone < ActiveRecord::Base
  belongs_to :user
  has_many :projects, dependent: :destroy

  validates :title, presence: true

  # def self.create_from(data_yupe)
  #   create
  # end
end
