require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(Name: 'John Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0) }
  let(:post) do
    Post.new(Author_id: user.id, Title: 'My first post', Text: 'This is my first post', CommentsCounter: 0,
             LikesCounter: 0)
  end
  let(:comment) { Comment.new(User_id: user.id, Post_id: post.id, Text: 'This is my first comment') }

  before { user.save! }
  before { post.save! }
  before { comment.save! }

  it 'update_post_comment_count should be called automatically on saveing comments' do
    post.reload
    expect(post.CommentsCounter).to eq(1)
  end
end
