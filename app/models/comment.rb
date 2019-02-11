class Comment < ApplicationRecord
  belongs_to :post
  has_one :comment.user
  validates :body, presence: true
end