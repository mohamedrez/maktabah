class Course < ApplicationRecord
  belongs_to :track
  has_and_belongs_to_many :profiles
  has_rich_text :description
  has_many :steps
  has_many :user_progresses, as: :progressable

  validates_presence_of :name, :position, :track_id
  validates_uniqueness_of :position

  def completed?
    steps.any? ? steps.all? {|step| step.user_progresses.first.completed?} : false
  end
end
