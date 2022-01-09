class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships, id: false do |t|
      t.integer :person_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
