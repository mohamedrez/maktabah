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
require "rails_helper"

RSpec.describe(Lecture, type: :model) do
  before do
    @lecture = FactoryBot.create(:lecture, youtube_video_link: "https://www.youtube.com/watch?v=cND5yDV1qJs&list=PLhMbosvUbsfHRGL8BvjFY92mtUvi8ZPnk&index=55&t=24s")
  end

  describe "#youtube_id" do
    it "returns the id of youtube video" do
      expect(@lecture.get_my_asset).to eql("cND5yDV1qJs")
    end
  end
end
