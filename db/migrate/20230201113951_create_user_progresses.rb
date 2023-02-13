# frozen_string_literal: true

class CreateUserProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table(:user_progresses) do |t|
      t.integer(:status)
      t.references(:user, null: false, foreign_key: true)
      t.references(:progressable, polymorphic: true, null: false)

      t.timestamps
    end
  end
end
