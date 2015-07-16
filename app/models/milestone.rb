class Milestone < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
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
        date_start: create_date(position[:start_date]),
        present: position.is_current,
        description: position.summary
      )
      milestone.update( date_end: create_date(position[:end_date]) ) unless position.end_date.blank?
    end
  end

  def self.create_from_education(client, user)
    education = client.profile(:fields => ["educations"])
    education[:educations][:all].each do |education|
      milestone = self.create(
        user_id: user.id,
        title: education.field_of_study,
        company: education.school_name,
        date_start: create_date(education[:start_date]),
        date_end: create_date(education[:end_date]),
        description: education.notes
      )
    end
  end

  def self.create_date(date_hash)
    return if date_hash.blank?

    Date.new *[date_hash[:year], date_hash[:month]].compact

    # if date_hash[:month].blank?
    #  Date.new( date_hash[:year] )
    # else
    #   Date.new( date_hash[:year], date_hash[:month] )
    # end
  end

  def default_present
    self.present ||= false if self.present.blank?
  end

end
