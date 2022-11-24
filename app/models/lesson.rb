class Lesson < ApplicationRecord
  belongs_to :course
  has_one_attached :transcription
  has_one_attached :audio
end
