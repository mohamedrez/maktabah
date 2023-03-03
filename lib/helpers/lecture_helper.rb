# frozen_string_literal: true

module LectureHelper
  def youtube_id(url)
    youtube_formats = [
      %r(https?://youtu\.be/(.+)),
      %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
      %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
      %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
      %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
    ]

    url.strip!
    return unless url.include? "youtu"

    youtube_formats.find { |format| url =~ format } and Regexp.last_match(1)
  end
end
