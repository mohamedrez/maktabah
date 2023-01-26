class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def index
    @track = Track.find(params[:track_id])
    @courses = @track.courses
  end
end
