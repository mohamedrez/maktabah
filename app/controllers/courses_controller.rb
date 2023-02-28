# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  def show
    @course = Course.find(params[:id])
    @progress_hash = {}
    return unless current_user

    step_progresses = UserProgress.where(
      user_id: current_user.id, progressable_type: "Step"
    ).pluck(:id, :status)
     .each{ |id, status| @progress_hash[id] = status }

  end

  def index
    @track = Track.find(params[:track_id])
    @courses = @track.courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: "Great! The Course has been created!"
    else
      flash.now[:alert] = "Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  private
  def course_params
    params.require(:course).permit(:track_id, :position, :name, :description)
  end
end
