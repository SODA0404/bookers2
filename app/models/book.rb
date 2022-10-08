class Book < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
