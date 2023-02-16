# frozen_string_literal: true

require_relative "../../lib/helpers/lecture_helper"

class StepsController < ApplicationController
  include LectureHelper

  def index
    @steps = Step.where(course_id: params[:course_id])
  end

  def show
    @step = Step.find(params[:id])
    @youtube_id = youtube_embed(Lecture.find(@step.stepable_id).youtube_video_link)
    if current_user
      @user_progress = UserProgress.find_or_create_by!(user: current_user, progressable: @step)
      @user_progress.update(status: :started) unless @user_progress.status
      UserProgressHistory.create!(step: @step, user: current_user)
    end
  end
end
