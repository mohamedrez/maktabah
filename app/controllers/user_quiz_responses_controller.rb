class UserQuizResponsesController < ApplicationController
    def create
        if current_user
            @response = params[:response].to_s
            @quiz = Quiz.find(params[:quiz_id])
            @course = @quiz.answer.course

            @user_quiz_response = UserQuizResponse.find_or_create_by!(user: current_user, quiz: @quiz)
            @user_quiz_response.update_attribute("response", @response)
            respond_to do |format|
                if @response == @quiz.response
                    format.html { redirect_to @course, :notice => 'The answers are all true.' }
                else
                    format.html { redirect_to @course, :notice => 'At least one answer is false' }
                end
            end
        end
    end
end
