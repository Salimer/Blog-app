require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comments_counter' do
    it 'updates the post comments_counter attribute' do
      # Arrange
      user = User.create(name: 'Sam')
      post = Post.create(title: 'Hello', author: user)
      Comment.create(author: user, post:)

      # Assert
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
