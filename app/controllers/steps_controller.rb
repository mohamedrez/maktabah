# frozen_string_literal: true

require "json"

class StepsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  authorize_resource
  before_action :set_course_step, only: [:show]
  before_action :set_course, only: [:new, :create]

  def index
    @steps = Step.where(course_id: params[:course_id])
  end

  def show
    @index_plus_one = @course.steps.index(@step) + 1

    unless @step.stepable_type == "Lecture" && Lecture.find(@step.stepable_id).audio_file.attached?
      @my_asset = @step.stepable.get_my_asset
    end

    if current_user
      @up_status = @step.up_status current_user
      @user_progress = UserProgress.find_by!(user: current_user, progressable: @step)
    end
  end

  def new
    @step = @course.steps.new
    @stepable = params[:stepable]
  end

  def create
    @step = @course.steps.new(step_params)

    @step.stepable = if params[:stepable] == "lecture"
      Lecture.create!(youtube_video_link: params[:youtube_video_link])
    else
      Quiz.create!(surveyjs: params[:surveyjs], answer: params[:answer])
    end

    if @step.save
      redirect_to course_step_url(@course, @step), notice: t("flash.steps_controller.step_been_created")
    else
      flash.now[:alert] = t("flash.fix_your_mistakes")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def step_params
    params.require(:step).permit(:position, :name)
  end

  def set_course_step
    @course = Course.find(params[:course_id])
    @step = Step.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
