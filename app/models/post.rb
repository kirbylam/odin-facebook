class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  after_save :default_params
  def default_params
    self.likes = 0
  end
end
