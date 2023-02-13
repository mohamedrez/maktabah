# frozen_string_literal: true

class AddNameToSteps < ActiveRecord::Migration[7.0]
  def change
    add_column(:steps, :name, :string)
  end
end
