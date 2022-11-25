class AddLevelToTrack < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :level, :integer
  end
end
