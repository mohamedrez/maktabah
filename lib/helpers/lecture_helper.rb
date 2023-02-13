# frozen_string_literal: true

module LectureHelper
  def youtube_embed(youtube_url)
    youtube_url[%r{^.*((v/)|(embed/)|(watch\?))\??v?=?([^&?]*).*}]
  end
end
