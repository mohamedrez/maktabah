class Step < ApplicationRecord
  belongs_to :course
  belongs_to :stepable, polymorphic: true
  has_one :user_progress, as: :progressable
end
