class Notification < ApplicationRecord
  has_one :notification_sending, foreign_key: :sent_notification_id
  has_one :sender, through: :notification_sending, class_name: 'User'

  has_one :notification_receiving, foreign_key: :received_notification_id
  has_one :receiver, through: :notification_receiving, class_name: 'User'
end
