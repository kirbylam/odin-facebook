class Post < ApplicationRecord
  has_many :comments
  
  has_one :post_authoring, foreign_key: :authored_post_id
  has_one :author, through: :post_authoring, source: :post_author

  has_many :post_likings, foreign_key: :liked_post_id
  has_many :likers, through: :post_likings

  validates :body, presence: true

  def likes
    self.likers.count
  end

  def liked?(user)
    return true if self.likers.exists?(user)
    false
  end
end
