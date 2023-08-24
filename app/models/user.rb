class User < ApplicationRecord
  # user post assosiation
  has_many :posts, dependent: :destroy, foreign_key: 'Author_id'

  # user post like assosiation
  has_many :likes, dependent: :destroy, foreign_key: 'User_id'

  # user post comment assosiation
  has_many :comments, dependent: :destroy, foreign_key: 'User_id'

  def recent_three_posts
    Post.where(Author_id: id).order(created_at: :desc).first(3)
  end
end
