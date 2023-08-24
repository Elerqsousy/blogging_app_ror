class RenameLikeCounterToLikesCounterInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :LikeCounter, :LikesCounter
  end
end
