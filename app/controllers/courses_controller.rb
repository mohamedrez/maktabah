# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # load_and_authorize_resource except: [:index, :show]
  authorize_resource except: [:index, :show]

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

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: t("flash.courses_controller.course_been_created")
    else
      flash.now[:alert] = t("flash.fix_your_mistakes")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:track_id, :position, :name, :description)
  end
end
