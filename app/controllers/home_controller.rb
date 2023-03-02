# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      @active_step = Home.active_step(current_user)
      @active_course = Home.active_course(current_user)
      @in_progress = Home.in_progress(current_user)
      @completed_courses = Home.completed_courses(current_user)
    end
  end
end
