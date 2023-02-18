# frozen_string_literal: true

require_relative "../../lib/helpers/lecture_helper"

class StepsController < ApplicationController
  include LectureHelper

  def index
    @steps = Step.where(course_id: params[:course_id])
  end

  def show
    @step = Step.find(params[:id])
    @course = Course.find(params[:course_id])
    @user_progress = UserProgress.find_by(progressable: @step)

    if @step.stepable_type == "Lecture"
      @youtube_id = youtube_embed(Lecture.find(@step.stepable_id).youtube_video_link)
      if current_user
        @user_progress = UserProgress.find_or_create_by!(user: current_user, progressable: @step)
        @user_progress.update_attribute("status", :started) unless @user_progress.status
        UserProgressHistory.create!(step: @step, user: current_user)
      end
    end
  end

  def update_status
    @step = Step.find(params[:id])
    @course = Course.find(params[:course_id])
    @user_progress = UserProgress.find_by(progressable: @step)

    unless @user_progress.completed?
      @user_progress.completed!
    else
      @user_progress.started!
    end

    respond_to do |format|
      format.html { redirect_to course_step_url(@course ,@step)}
      format.js {render :update_status}
    end
  end
end
