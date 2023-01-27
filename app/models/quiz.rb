class Quiz < ApplicationRecord
  has_one :step, as: :stepable
end
