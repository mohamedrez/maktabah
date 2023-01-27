class Lecture < ApplicationRecord
  has_one :step, as: :stepable
  has_one_attached :audio_file
end
