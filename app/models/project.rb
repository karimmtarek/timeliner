class Project < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: lambda {|attributes| attributes['image'].blank?}
end
