require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  test 'new notification' do
    notification = Notification.new(sender: users(:user1), receiver: users(:user2), friend_request: true)
    assert notification.valid?
  end

  test 'default is false' do
    notification = Notification.new(sender: users(:user1), receiver: users(:user2))
    assert_not notification.friend_request
  end

  test 'notification association' do
    notification = Notification.create(sender: users(:user1), receiver: users(:user2), friend_request: true)
    assert_equal users(:user2), users(:user1).sent_notifications.first.receiver
    assert_equal users(:user1), users(:user2).received_notifications.first.sender
  end
end
