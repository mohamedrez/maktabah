# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      @active_step = active_step
      @active_course = active_course
      @in_progress = in_progress
      @completed_courses = completed_courses
    end
  end

  private

  def active_step
    up = UserProgress.where(user: current_user, progressable_type: "Step", status: :started).last!.progressable_id
    Step.find(up)
  end

  def active_course
    up = UserProgress.where(user: current_user, progressable_type: "Course", status: :started).last!.progressable_id
    Course.find(up)
  end

  def in_progress
    UserProgress.where(user: current_user, progressable_type: "Course", status: :started).pluck(:progressable_id)
  end

  def completed_courses
    UserProgress.where(user: current_user, progressable_type: "Course", status: :completed).pluck(:progressable_id)
  end
end
