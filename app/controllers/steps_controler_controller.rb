class StepsControlerController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @steps = @course.steps
  end
end
