class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[params['id']])
    @recent_posts = @user.recent_three_posts
  end
end
