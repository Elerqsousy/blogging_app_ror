class Like < ApplicationRecord
  # user post like assosiation
  belongs_to :user, class_name: 'User', foreign_key: 'User_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'Post_id'

  after_save :update_post_like_count

  private

  def update_post_like_count
    like_count = like.where(Post_id: self.Post_id).count
    post.update(LikesCounter: like_count)
  end
end
