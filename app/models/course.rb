class Course < ApplicationRecord
  belongs_to :track
  has_and_belongs_to_many :profiles
  has_rich_text :description
  validates_presence_of :name, :position, :track_id
  validates_uniqueness_of :position
  has_many :steps, dependent: :destroy
  has_many :user_progresses, as: :progressable

end
