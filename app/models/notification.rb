class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  def unread_count(user_id)
    where(recipient_id: user_id, read_at: nil).count
  end
end
