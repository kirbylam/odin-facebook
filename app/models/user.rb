class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, foreign_key: 'person_id', class_name: 'Friendship'
  has_many :friends, through: :friendships

  has_many :notification_receivings, foreign_key: :receiver_id
  has_many :received_notifications, through: :notification_receivings, class_name: 'Notification'

  has_many :notification_sendings, foreign_key: :sender_id
  has_many :sent_notifications, through: :notification_sendings, class_name: 'Notification'

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :all_except, ->(user) { where.not(id: user) }

  def full_name()
    self.first_name + ' ' + self.last_name
  end

  def befriend(user)
    self.friends << user
    user.friends << self
  end
end
