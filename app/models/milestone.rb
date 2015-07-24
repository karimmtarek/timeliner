class Milestone < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: :slugged

  validates :title, presence: true

  scope :current, -> {where(present: true).order(date_start: :desc)}
  scope :older, -> {where(present: false).order(date_start: :desc)}

  after_initialize :default_present

  private

  def default_present
    self.present ||= false if self.present.blank?
  end
end
