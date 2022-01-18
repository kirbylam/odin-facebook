class CreatePostAuthorings < ActiveRecord::Migration[6.1]
  def change
    create_table :post_authorings, id: false do |t|
      t.integer :post_author_id
      t.integer :authored_post_id

      t.timestamps
    end
  end
end
