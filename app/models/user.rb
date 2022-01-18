class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_authorings, foreign_key: :post_author_id
  has_many :authored_posts, through: :post_authorings

  has_many :post_likings, foreign_key: :liker_id
  has_many :liked_posts, through: :post_likings

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :all_except, ->(user) { where.not(id: user) }

  def full_name()
    self.first_name + ' ' + self.last_name
  end
end
