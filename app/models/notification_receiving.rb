class NotificationReceiving < ApplicationRecord
  belongs_to :receiver, class_name: 'User'
  belongs_to :received_notification, class_name: 'Notification'
end
