# frozen_string_literal: true

module LectureHelper
  def youtube_id(url)
    v_index = url.index("v=")
    url[v_index + 2..v_index + 12]
  end
end
