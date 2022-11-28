class AddDurationToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :duration, :integer
  end
end
