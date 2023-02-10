class HomeController < ApplicationController
  def index
    if current_user
      @last_step = UserProgressHistory.get_last_step(current_user)
      @last_course = UserProgressHistory.get_last_course(current_user)
      @complete_courses = UserProgress.where(user: current_user, progressable_type: "Course")
    end
  end
end
