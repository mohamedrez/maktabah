# frozen_string_literal: true

class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table(:homes, &:timestamps)
  end
end
