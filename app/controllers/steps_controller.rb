require_relative '../../lib/helpers/lecture_helper'
include LectureHelper

class StepsController < ApplicationController
  def index
    @steps = Step.where(course_id: params[:course_id])
  end
  def show
    @step = Step.find(params[:id])
    @youtube_id = youtube_embed(Lecture.find(@step.stepable_id).youtube_video_link)
  end
end
