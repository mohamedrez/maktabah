require_relative '../../lib/helpers/lecture_helper'
include LectureHelper

class StepsController < ApplicationController
  def index
    @steps = Step.where(course_id: params[:course_id])
    @steps_statuses = []
    if current_user
      @steps.each do |step|
        user_progress = step.user_progresses.where!(user_id: current_user.id).first
        @steps_statuses << {step: step, status: user_progress.status}
      end
    end
  end
  def show
    @step = Step.find(params[:id])
    @youtube_id = LectureHelper.youtube_embed(Lecture.find(@step.stepable_id).youtube_video_link)
    
    if current_user
      @step.user_progresses.first_or_create!(user_id: current_user.id).update!(status: 0)
    end
  end
end
