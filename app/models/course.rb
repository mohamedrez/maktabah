class Course < ApplicationRecord
  belongs_to :track
  has_and_belongs_to_many :profiles
  has_rich_text :description
  has_many :steps
  has_one :user_progress, as: :progressable

  validates_presence_of :name, :position, :track_id
  validates_uniqueness_of :position

  def completed?
    completed_steps = 0
    steps.each { |step| completed_steps += 1 if step.user_progress.completed? }
    completed_steps == steps.count ? true : false
  end
end
