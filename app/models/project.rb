class Project < ActiveRecord::Base
  extend FriendlyId
  extend Fetchable

  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: lambda { |attributes| attributes['image'].blank? }

  validates :title, :client, :published_on, presence: true
  validates :description, length: { in: 75..500 }
  validates :client_url,
            :link_live,
            :link_source,
            format: {
              with: URI.regexp(['http', 'https']),
              message: 'format should match http://link.com'
            },
            allow_blank: true
end
