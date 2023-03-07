# frozen_string_literal: true

class UserProgressesController < ApplicationController
  before_action :authenticate_user!

  def update
    step = Step.find(params[:step_id])
    course = Course.find(step.id)

    UserProgress.find_by(user: current_user, progressable: step).update_status

    UserPoint.score_me(current_user, step)

    respond_to do |format|
      format.html { redirect_to course_step_url(course, step) }
      format.js { render "steps/update_status", locals: {step_id: step.id} }
    end
  end
end
