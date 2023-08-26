require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(Name: 'John Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0) }
  let(:post) do
    Post.new(Author_id: user.id, Title: 'My first post', Text: 'This is my first post', CommentsCounter: 0,
             LikesCounter: 0)
  end

  before { user.save! }
  before { post.save! }

  it 'Title should be present' do
    post.Title = nil
    expect(post).to_not be_valid
  end

  it 'Title should be less than 250 charachter' do
    post.Title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be present' do
    post.CommentsCounter = nil
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be numerical' do
    post.CommentsCounter = 'a'
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be at least zero' do
    post.CommentsCounter = -1
    expect(post).to_not be_valid
  end

  it 'CommentsCounter can be zero' do
    post.CommentsCounter = 0
    expect(post).to be_valid
  end

  it 'LikesCounter should be present' do
    post.LikesCounter = nil
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be numerical' do
    post.LikesCounter = 'a'
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be at least zero' do
    post.LikesCounter = -1
    expect(post).to_not be_valid
  end

  it 'LikesCounter can be zero' do
    post.LikesCounter = 0
    expect(post).to be_valid
  end

  it 'update_user_posts_counter should be called automatically on saveing posts' do
    user.reload
    expect(user.PostsCounter).to eq(1)
  end

  it 'recent five comments to return 0..5 comments' do
    Comment.create!(Text: 'This is my first comment', User_id: user.id, Post_id: post.id)
    Comment.create!(Text: 'This is my second comment', User_id: user.id, Post_id: post.id)
    Comment.create!(Text: 'This is my third comment', User_id: user.id, Post_id: post.id)
    Comment.create!(Text: 'This is my fourth comment', User_id: user.id, Post_id: post.id)
    Comment.create!(Text: 'This is my fifth comment', User_id: user.id, Post_id: post.id)
    Comment.create!(Text: 'This is my sixth comment', User_id: user.id, Post_id: post.id)
    expect(post.recent_five_comments.length).to eq(5)
  end
end
