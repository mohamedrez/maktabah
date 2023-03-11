class AddColsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, limit: 255
    add_column :users, :learning_goal, :text
    add_column :users, :avatar, :string
  end
end
