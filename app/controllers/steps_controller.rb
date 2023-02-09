class StepsController < ApplicationController
  def index
    @steps = Step.where(course_id: params[:course_id])
  end
  def show
    @step = Step.find(params[:id])
    if current_user
      @user_progress = UserProgress.find_or_create_by!(user: current_user, progressable: @step)

      @user_progress.update_attribute('status', :started) unless @user_progress.status

      UserProgressHistory.create!(step: @step, user: current_user)
    end
  end
end
