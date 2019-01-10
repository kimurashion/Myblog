class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # @post.comments
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50, message: 'タイトルは50文字以下です' }
  validates :body, presence: true, length: { maximum: 1000, message: '本文は1000文字以下です' }
  mount_uploader :image, ImageUploader
end

