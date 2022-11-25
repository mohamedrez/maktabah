class Course < ApplicationRecord
  belongs_to :scholar
  belongs_to :track
end
