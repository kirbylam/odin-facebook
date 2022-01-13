class NotificationSending < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :sent_notification, class_name: 'Notification'
end
