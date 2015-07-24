class Project < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: lambda {|attributes| attributes['image'].blank?}

  validates :title, :client, presence: true
  validates :description, length: { in: 75..500 }
end
