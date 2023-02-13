# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  track_id   :bigint           not null
#  name       :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
