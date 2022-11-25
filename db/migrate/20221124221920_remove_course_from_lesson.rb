class RemoveCourseFromLesson < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :course_id
  end
end
