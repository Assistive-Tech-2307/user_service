class Comment < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :user_comment, presence: true

  belongs_to :category
  belongs_to :user
end
