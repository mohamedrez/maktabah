class AddFieldsToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :surveyjs, :text
    add_column :quizzes, :answer, :string
  end
end
