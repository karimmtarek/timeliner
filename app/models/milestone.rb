class Milestone < ActiveRecord::Base
  belongs_to :user
  has_many :projects, dependent: :destroy

  validates :title, presence: true

  def self.create_from_position(client, user)
    positions = client.profile(:fields => ["positions"])
    positions[:positions][:all].each do |position|
      milestone = self.create(
        user_id: user.id,
        title: position.title,
        company: position.company.name,
        date_start: Date.new(position.start_date.year, position.start_date.month),
        present: position.is_current,
        description: position.summary
      )
      milestone.update(date_end: Date.new(position.end_date.year, position.end_date.month)) unless position.end_date.nil?
    end
  end

  def self.create_from_education(client, user)
    education = client.profile(:fields => ["educations"])
    education[:educations][:all].each do |education|
      self.create(
        user_id: user.id,
        title: education.field_of_study,
        company: education.school_name,
        date_start: Date.new(education.start_date.year),
        date_end: Date.new(education.end_date.year),
        present: education.is_current,
        description: education.notes
      )
    end
  end
end
