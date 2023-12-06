class Comment < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :user_comment, presence: true
  validates :rating, presence: true
  validates :user_recommended, presence: true

  belongs_to :category
  belongs_to :user
end
