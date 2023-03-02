class CreateUserPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :user_points do |t|
      t.references :user, null: false, foreign_key: true
      t.references :scorable, polymorphic: true, null: false
      t.boolean :check?, default: false
      t.integer :point

      t.timestamps
    end
  end
end
