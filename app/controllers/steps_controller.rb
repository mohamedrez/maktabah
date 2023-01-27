class StepsController < ApplicationController
  def index
    @steps = Step.where(course_id: params[:course_id])
  end
end
