class UserNotificationsController < ApplicationController
  def index
    @user_notifications = Notification.where(read_at: nil, recipient_id: current_user.id)
  end

  def notification_bell
    @unread_count = Notification.where(read_at: nil, recipient_id: current_user.id).count
  end
end
