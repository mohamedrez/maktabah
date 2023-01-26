class Track < ApplicationRecord
  has_rich_text :description
  has_many :courses, -> { order(position: :asc) }
end
