class Step < ApplicationRecord
  belongs_to :course
  belongs_to :stepable, polymorphic: true
  has_many :user_progresses, as: :progressable

end
