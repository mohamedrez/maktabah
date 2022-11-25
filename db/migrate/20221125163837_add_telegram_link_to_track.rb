class AddTelegramLinkToTrack < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :telegram_link, :text
  end
end
