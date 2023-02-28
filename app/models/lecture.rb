# frozen_string_literal: true

# == Schema Information
#
# Table name: lectures
#
#  id                 :bigint           not null, primary key
#  youtube_video_link :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Lecture < ApplicationRecord
  include LectureHelper

  has_one :step, as: :stepable
  has_one_attached :audio_file

  def get_my_asset
    youtube_embed(youtube_video_link)
  end
end
