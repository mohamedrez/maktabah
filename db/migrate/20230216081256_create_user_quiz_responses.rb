class CreateUserQuizResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_quiz_responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.string :response

      t.timestamps
    end
  end
end
