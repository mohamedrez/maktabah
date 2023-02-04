class StepsController < ApplicationController
  def index
    @steps = Step.where(course_id: params[:course_id])
  end
  def show
    @step = Step.find(params[:id])
    @youtube_id = youtube_embed(Lecture.find(@step.stepable_id).youtube_video_link)
    
    if current_user
      @step.user_progresses.first_or_create!(user_id: current_user.id).update!(status: 0)
    end
  end

  private
  def youtube_embed(youtube_url)
    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
    youtube_id = $5
  end
end
