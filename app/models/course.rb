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
  validates :name, :position, :track_id, presence: true
  validates :position, uniqueness: true
  has_many :steps, dependent: :destroy
  has_many :user_progresses, as: :progressable, dependent: :destroy
  has_one :user_point, as: :scorable, dependent: :destroy
  delegate :count, to: :steps, prefix: true

  def get_work_done(current_user)
    progress_hash = {}
    up = UserProgress.where(user: current_user, progressable_type: "Step").pluck(:progressable_id, :status)
    s = steps.pluck(:id)
    up.each do |progressable_id, status|
      progress_hash[progressable_id] = status if s.include?(progressable_id)
    end
    progress_hash
  end
end
