# frozen_string_literal: true

# == Schema Information
#
# Table name: homes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Home < ApplicationRecord
  def self.active_step(current_user)
    up = UserProgress.where(user: current_user, progressable_type: "Step", status: :started).last!.progressable_id
    Step.find(up)
  end

  def self.active_course(current_user)
    up = UserProgress.where(user: current_user, progressable_type: "Course", status: :started).last!.progressable_id
    Course.find(up)
  end

  def self.in_progress(current_user)
    UserProgress.where(user: current_user, progressable_type: "Course", status: :started).pluck(:progressable_id)
  end

  def self.completed_courses(current_user)
    UserProgress.where(user: current_user, progressable_type: "Course", status: :completed).pluck(:progressable_id)
  end
end
