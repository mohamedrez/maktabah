# frozen_string_literal: true

class UserProgressesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_progress = UserProgress.find_or_create_by(
      user_id: current_user.id,
      progressable_id: user_progress_params[:step_id],
      progressable_type: "Step",
    ).update!(status: user_progress_params[:status])
    head(:no_content)
  end

  private

  def user_progress_params
    params.require(:user_progress).permit(:user_id, :step_id, :status)
  end
end
