require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'John Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0) }

  before { subject.save! }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be present' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be numerical' do
    subject.PostsCounter = 'a'
    expect(subject).to_not be_valid
  end

  it 'PostCounter can be 0' do
    subject.Name = 0
    expect(subject).to be_valid
  end

  it 'recent_three_posts method to return 0..3 posts of the user' do
    subject.posts.create!(Title: 'My first post', Text: 'This is my first post', CommentsCounter: 0, LikesCounter: 0)
    subject.posts.create!(Title: 'My second post', Text: 'This is my second post', CommentsCounter: 0, LikesCounter: 0)
    subject.posts.create!(Title: 'My third post', Text: 'This is my third post', CommentsCounter: 0, LikesCounter: 0)
    subject.posts.create!(Title: 'My fourth post', Text: 'This is my fourth post', CommentsCounter: 0, LikesCounter: 0)
    subject.posts.create!(Title: 'My fifth post', Text: 'This is my fifth post', CommentsCounter: 0, LikesCounter: 0)

    expect(subject.recent_three_posts.length).to eq(3)
  end
end
