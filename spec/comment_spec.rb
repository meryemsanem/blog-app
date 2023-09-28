require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Comment.new(user: user, post: post, text: 'Sample Comment') }
  
  before { subject.save }

  it 'updates the post commentsCounter when a comment is created' do
    expect {
      comment = Comment.create(user: user, post: post, text: 'Sample Comment 2')
      comment.save
    }.to change { post.reload.commentsCounter }.by(1)
  end
end
