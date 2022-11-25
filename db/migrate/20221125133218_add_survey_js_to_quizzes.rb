class AddSurveyJsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :survey_js, :text
  end
end
