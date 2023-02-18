class UserQuizResponsesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        if current_user
            @response = params[:response]
            @step = Step.find(params[:quiz_id])
            @quiz = @step.stepable
            @course = @step.course

            @user_quiz_response = UserQuizResponse.find_or_create_by!(user: current_user, quiz: @quiz)
            @user_quiz_response.update_attribute("response", @response)

            if @response == @quiz.answer
                @user_progress = UserProgress.find_by(progressable: @step)
                @user_progress.completed! unless @user_progress.completed?
                flash[:notice] = 'The quiz is passed.'
                render js: %(window.location.pathname='#{course_path(@course)}')
            else
                flash[:alert] = "The quiz isn't passed."
                render js: %(window.location.pathname='#{course_step_path(@course, @step)}')
            end
        end
    end
end
