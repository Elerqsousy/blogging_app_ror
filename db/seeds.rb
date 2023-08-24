# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 2 users

user1 = User.create!(Name: 'John Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0)
user2 = User.create!(Name: 'Jane Doe', Photo: 'hhddudui', Bio: 'I am John Doe', PostsCounter: 0)

# Create 5 posts for a user 1

user1.posts.create!(Title: 'My first post', Text: 'This is my first post', CommentsCounter: 0, LikesCounter: 0)
user1.posts.create!(Title: 'My second post', Text: 'This is my second post', CommentsCounter: 0, LikesCounter: 0)
user1.posts.create!(Title: 'My third post', Text: 'This is my third post', CommentsCounter: 0, LikesCounter: 0)
user1.posts.create!(Title: 'My fourth post', Text: 'This is my fourth post', CommentsCounter: 0, LikesCounter: 0)
user1.posts.create!(Title: 'My fifth post', Text: 'This is my fifth post', CommentsCounter: 0, LikesCounter: 0)

# Create 6 comments for the first post of user John Doe

Comment.create!(Text: 'This is my first comment', User_id: 1, Post_id: 1)
Comment.create!(Text: 'This is my second comment', User_id: 1, Post_id: 1)
Comment.create!(Text: 'This is my third comment', User_id: 1, Post_id: 1)
Comment.create!(Text: 'This is my fourth comment', User_id: 1, Post_id: 1)
Comment.create!(Text: 'This is my fifth comment', User_id: 1, Post_id: 1)
Comment.create!(Text: 'This is my sixth comment', User_id: 1, Post_id: 1)
