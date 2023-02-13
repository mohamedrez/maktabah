# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :track
  has_and_belongs_to_many :profiles
  has_rich_text :description
  validates_presence_of :name, :position, :track_id
  validates_uniqueness_of :position
  has_many :steps, dependent: :destroy
  has_many :user_progresses, as: :progressable

  def steps_count
    steps.count
  end
end
