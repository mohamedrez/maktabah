# frozen_string_literal: true

class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table(:lectures) do |t|
      t.string(:youtube_video_link)
      t.timestamps
    end
  end
end
