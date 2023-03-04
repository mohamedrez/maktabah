class AddIndexToPositionFromCourses < ActiveRecord::Migration[7.0]
  def change
    add_index :courses, :position, unique: true
  end
end
