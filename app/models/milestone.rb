class Milestone < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :projects, dependent: :destroy
  friendly_id :title, use: :slugged

  # validates :title, presence: true

  scope :current, -> {where(present: true).order(date_start: :desc)}
  scope :older, -> {where(present: false).order(date_start: :desc)}

  after_initialize :default_present


  def self.create_from_position(client, user)
    positions = client.profile(:fields => ["positions"])
    positions[:positions][:all].each do |position|
      # binding.pry
      milestone = self.create(
        user_id: user.id,
        title: position.title,
        company: position.company.name,
        date_start: set_date(position, :start_date),
        present: position.is_current,
        description: position.summary
      )
      milestone.update( date_end: set_date(position, :end_date) ) unless position.end_date.nil?
    end
  end

  def self.create_from_education(client, user)
    education = client.profile(:fields => ["educations"])
    education[:educations][:all].each do |education|
      milestone = self.create(
        user_id: user.id,
        title: education.field_of_study,
        company: education.school_name,
        date_start: set_date(education, :start_date),
        date_end: set_date(education, :end_date),
        description: education.notes
      )
    end
  end

  def self.set_date(obj, date_attr)
    unless obj[date_attr].blank?
      if obj[date_attr][:month].blank?
        Date.new( obj[date_attr][:year] )
      else
        Date.new( obj[date_attr][:year], obj[date_attr][:month] )
      end
    end
  end

  def default_present
    self.present ||= false if self.present.nil?
  end

end
