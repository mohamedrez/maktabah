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
                flash[:notice] = 'The answers are all true.'
                render js: %(window.location.pathname='#{course_path(@course)}')
            else
                flash[:alert] = 'At least one answer is false'
                render js: %(window.location.pathname='#{course_path(@course)}')
            end
        end
    end
end
