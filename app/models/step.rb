# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  course_id     :bigint           not null
#  position      :integer
#  stepable_type :string(255)      not null
#  stepable_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)
#

require_relative "../../lib/helpers/lecture_helper"

class Step < ApplicationRecord
  include LectureHelper
  
  belongs_to :course
  belongs_to :stepable, polymorphic: true
  has_many :user_progresses, as: :progressable

  def next_step
    steps = Course.find(course_id).steps
    index_plus_one = steps.index(self) + 1
    return if index_plus_one >= steps.count
    steps[index_plus_one]
  end

  # organization show action

  def up_status(current_user)
    user_progress = UserProgress.find_or_create_by!(user: current_user, progressable: self)
    user_progress.update!(status: :started) unless user_progress.status
    user_progress.status
  end

  def get_my_asset
    if stepable_type == "Lecture"
      youtube_embed(Lecture.find(stepable_id).youtube_video_link)
    elsif stepable_type == "Quiz"
      JSON.parse(stepable.surveyjs).to_json
    end
  end
end
