# frozen_string_literal: true

require 'json'

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

    @my_assets = @step.get_my_assets

    if current_user
      @up_status = @step.up_status current_user
      UserProgressHistory.create!(step: @step, user: current_user)
    end
  end

  def update_status
    @user_progress = UserProgress.find_by(progressable: @step)

    unless @user_progress.completed?
      @user_progress.completed!
    else
      @user_progress.started!
    end

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
    if params[:stepable] == "lecture"
      @step.stepable = Lecture.create!(youtube_video_link: params[:youtube_video_link])
    else
      @step.stepable = Quiz.create!(surveyjs: params[:surveyjs], answer: params[:answer])
    end

    if @step.save
      redirect_to course_step_url(@course, @step), notice: "Great! The Step has been created!"
    else
      flash.now[:alert] = "Fix your mistakes, please."
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
