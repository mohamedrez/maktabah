class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :track, null: false, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
