class Lesson < ApplicationRecord
  has_one_attached :transcription
  has_one_attached :audio
  has_one :step, as: :stepable
end
