class Track < ApplicationRecord
  belongs_to :scholar
  has_one_attached :image

end
