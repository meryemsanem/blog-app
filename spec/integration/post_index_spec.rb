require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  before(:each) do
      @user = User.create(
      name: 'John',
      photo: 'john.jpg',
      bio: 'Web Developer',
      posts_counter: 0
    )


    @posts = [
      @post1 = Post.create(author: @user, title: 'User Post 1', text: 'This is User Post 1'),
      @post2 =  Post.create(author: @user, title: 'User Post 2', text: 'This is User Post 2'),
      @post3 = Post.create(author: @user, title: 'User Post 3', text: 'This is User Post 3'), 
  
    ]
    visit user_posts_url(user_id: @user.id)
  end
end