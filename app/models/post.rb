class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def update_user_posts_counter
    author.update(postsCounter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
