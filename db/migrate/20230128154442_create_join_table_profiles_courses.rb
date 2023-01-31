class CreateJoinTableProfilesCourses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :profiles, :courses do |t|
      t.index [:profile_id, :course_id]
      t.index [:course_id, :profile_id]
    end
  end
end
