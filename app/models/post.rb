class Post < ApplicationRecord
  # user post assosiation
  belongs_to :Author, class_name: 'User'

  # post like assosiation
  has_many :likes, dependent: :destroy

  # post comment assosiation
  has_many :comments, dependent: :destroy

  after_save :update_user_posts_counter

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_five_comments
    Comment.where(Post_id: id).order(created_at: :desc).first(5)
  end

  private

  def update_user_posts_counter
    posts_count = Post.where(Author_id: self.Author_id).count
    User.update(PostsCounter: posts_count)
  end
end
