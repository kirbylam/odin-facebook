class CreatePostLikings < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likings do |t|
      t.integer :liker_id
      t.integer :liked_post_id

      t.timestamps
    end
  end
end
