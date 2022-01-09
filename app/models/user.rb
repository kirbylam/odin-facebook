class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, foreign_key: 'person_id', class_name: 'Friendship'
  has_many :friends, through: :friendships

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name()
    self.first_name + ' ' + self.last_name
  end

  def befriend(user)
    self.friends << user
    user.friends << self
  end
end
