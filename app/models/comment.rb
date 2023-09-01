class Comment < ApplicationRecord
  # user post comment assosiation
  belongs_to :user, class_name: 'User', foreign_key: 'User_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'Post_id'

  after_save :update_post_comment_count

  private

  def update_post_comment_count
    comment_count = Comment.where(Post_id: self.Post_id).count
    post.update(CommentsCounter: comment_count)
  end
end
