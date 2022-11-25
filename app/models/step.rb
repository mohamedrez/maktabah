class Step < ApplicationRecord
  belongs_to :course
  belongs_to :stepable, polymorphic: true
end
