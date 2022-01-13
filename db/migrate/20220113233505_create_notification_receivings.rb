class CreateNotificationReceivings < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_receivings do |t|
      t.integer :receiver_id
      t.integer :received_notification_id

      t.timestamps
    end
  end
end
