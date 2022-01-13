class CreateNotificationSendings < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_sendings do |t|
      t.integer :sender_id
      t.integer :sent_notification_id

      t.timestamps
    end
  end
end
