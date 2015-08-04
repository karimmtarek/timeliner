class Milestone < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :user

  after_initialize :default_present

  validates :title, :location, :company, :date_start, presence: true

  validates :company_url,
            format: {
              with: URI.regexp(['http', 'https']),
              message: 'format should match http://link.com'
            },
            allow_blank: true

  scope :current, -> {where(present: true).order(date_start: :desc)}
  scope :older, -> {where(present: false).order(date_start: :desc)}

  private

  def default_present
    self.present ||= false if self.present.blank?
  end
end
