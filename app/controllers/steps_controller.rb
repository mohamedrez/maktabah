# frozen_string_literal: true

require "json"

class StepsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update_status]
  load_and_authorize_resource except: [:index, :show, :update_status]
  before_action :set_course_step, only: [:show, :update_status]
  before_action :set_course, only: [:new, :create]

  def index
    @steps = Step.where(course_id: params[:course_id])
  end

  def show
    @index_plus_one = @course.steps.index(@step) + 1

    @my_asset = @step.stepable.get_my_asset

    if current_user
      @up_status = @step.up_status current_user
    end
  end

  def update_status
    UserProgress.find_by(progressable: @step).update_status
    UserPoint.score_me(current_user, @step)

    respond_to do |format|
      format.html { redirect_to course_step_url(@course, @step) }
      format.js { render :update_status }
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
      redirect_to course_step_url(@course, @step), notice: t(".step_been_created")
    else
      flash.now[:alert] = t(".fix_your_mistakes")
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
