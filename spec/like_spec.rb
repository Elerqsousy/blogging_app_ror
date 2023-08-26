require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(Name: 'John Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0) }
  let(:post) do
    Post.new(Author_id: user.id, Title: 'My first post', Text: 'This is my first post', CommentsCounter: 0,
             LikesCounter: 0)
  end
  let(:like) { Like.new(User_id: user.id, Post_id: post.id) }

  before { user.save! }
  before { post.save! }
  before { like.save! }

  it 'update_post_like_count should be called automatically on saveing likes' do
    post.reload
    expect(post.LikesCounter).to eq(1)
  end
end
