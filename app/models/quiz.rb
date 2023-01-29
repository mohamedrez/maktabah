class Quiz < ApplicationRecord
  has_one :step, as: :stepable
  has_many :questions
end
