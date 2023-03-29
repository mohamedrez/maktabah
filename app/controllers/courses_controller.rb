# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource

  def index
    @track = Track.find(params[:track_id])
    @courses = @track.courses
  end

  def show
    @course = Course.find(params[:id])
    @progress_hash = {}
    return unless current_user
    @progress_hash = @course.get_steps_status(current_user)
  end
end
