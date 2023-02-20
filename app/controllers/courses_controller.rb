# frozen_string_literal: true

class CoursesController < ApplicationController
  load_and_authorize_resource except: [:index, :show]
  
  def show
    @course = Course.find(params[:id])
  end

  def index
    @track = Track.find(params[:track_id])
    @courses = @track.courses
  end

  def new 
    @course = Course.new
  end

  def create 
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: "Great! The Course has been created!"
    else
      flash.now[:alert] = "Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  private
  def course_params
    params.require(:course).permit(:track_id, :position, :name, :description)
  end
end
