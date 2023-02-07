class UserProgress < ApplicationRecord
  belongs_to :user
  belongs_to :progressable, polymorphic: true

  enum status: { started: 0, completed: 1 }

  # scope :not_completed, -> { where.not(status: [:completed]) }
end
