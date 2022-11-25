class AddPositionTrackToCourses < ActiveRecord::Migration[7.0]
  def change
    # add_column :courses, :position, :integer
    add_column :courses, :track_id, :bigint, index: true
  end
end
