class UserQuizResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @response = params[:response]
    @step = Step.find(params[:quiz_id])
    @quiz = @step.stepable
    @course = @step.course

    if current_user
      @user_quiz_response = UserQuizResponse.find_or_create_by!(user: current_user, quiz: @quiz)
      @user_quiz_response.update!(response: @response)

      if @response.delete(" ") == @quiz.answer.delete("\n").delete(" ")
        @user_progress = UserProgress.find_by(progressable: @step)
        @user_progress.completed! unless @user_progress.completed?
        flash[:notice] = "The quiz is passed."
        render js: %(window.location.pathname='#{course_path(@course)}')
      else
        flash[:alert] = "The quiz isn't passed."
        render js: %(window.location.pathname='#{course_step_path(@course, @step)}')
      end
    elsif @response.delete(" ") == @quiz.answer.delete("\n").delete(" ")
      flash[:notice] = "The quiz is passed."
      render js: %(window.location.pathname='#{course_path(@course)}')
    else
      flash[:alert] = "The quiz isn't passed."
      render js: %(window.location.pathname='#{course_step_path(@course, @step)}')
    end
  end
end
