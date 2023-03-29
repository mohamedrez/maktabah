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
class Step < ApplicationRecord
  belongs_to :course
  belongs_to :stepable, polymorphic: true
  has_one :user_point, as: :scorable, dependent: :destroy
  has_many :user_progresses, as: :progressable, dependent: :destroy

  def next_step
    steps = Course.find(course_id).steps
    index_plus_one = steps.index(self) + 1
    return if index_plus_one >= steps.count
    steps[index_plus_one]
  end

  def previous_step
    steps = Course.find(course_id).steps.order(id: :desc)
    index_minus_one = steps.index(self) + 1
    return if index_minus_one >= steps.count
    steps[index_minus_one]
  end

  def up_status(current_user)
    user_progress = UserProgress.find_or_create_by!(user: current_user, progressable: self)
    unless user_progress.status
      user_progress.update!(status: :started)

      course = Course.find(course_id)
      UserProgress.find_or_create_by!(user: current_user, progressable: course, status: :started)
    end
    user_progress.status
  end

  def which_type
    if stepable_type == "Lecture" && Lecture.find(stepable_id).youtube_video_link.present? && Lecture.find(stepable_id).audio_file.attached?
      "lecture"
    elsif stepable_type == "Lecture" && Lecture.find(stepable_id).youtube_video_link.present?
      "video"
    elsif stepable_type == "Lecture" && Lecture.find(stepable_id).audio_file.attached?
      "audio"
    elsif stepable_type == "Quiz"
      "quiz"
    end
  end
end
