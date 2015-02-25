class Project < ActiveRecord::Base
  belongs_to :milestone
  has_many :images
  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: lambda {|attributes| attributes['image'].blank?}
end
