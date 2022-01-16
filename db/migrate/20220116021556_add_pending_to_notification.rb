class AddPendingToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :status, :string
  end
end
