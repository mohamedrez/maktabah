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
FactoryBot.define do
  factory :lecture do
    youtube_video_link { "MyString" }
    audio_file { nil }
    step { nil }
  end
end
