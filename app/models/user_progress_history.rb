# frozen_string_literal: true

# == Schema Information
#
# Table name: user_progress_histories
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  step_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserProgressHistory < ApplicationRecord
  belongs_to :user
  belongs_to :step

  def self.get_last_step(user)
    Step.find(UserProgressHistory.where(user:).last.step_id)
  end

  def self.get_last_course(user)
    step = Step.find(UserProgressHistory.where(user:).last.step_id)
    Course.find(step.course_id)
  end
end
