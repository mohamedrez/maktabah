class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.references :scholar, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
