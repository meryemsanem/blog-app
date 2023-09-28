require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
    subject { Like.new(user:, post:) }
  before { subject.save }

  it '#like_counter' do
  expect {
    like = Like.create(user: user, post: post)
    like.save
  }.to change { post.reload.likesCounter }.by(1)
end
end
