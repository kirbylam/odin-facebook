class Post < ApplicationRecord
  has_one :post_authoring, foreign_key: :authored_post_id
  has_one :author, through: :post_authoring, source: :post_author

  has_many :post_likings, foreign_key: :liked_post_id
  has_many :likers, through: :post_likings

  validates :body, presence: true

  after_save :default_values
  def default_values
    self.likes = 0
  end
end
