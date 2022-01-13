class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.boolean :friend_request, default: false

      t.timestamps
    end
  end
end
