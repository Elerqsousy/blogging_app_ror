class PostsController < ApplicationController
  def index
    @user_posts = Post.where(Author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(Post_id: @post.id)
  end
end
