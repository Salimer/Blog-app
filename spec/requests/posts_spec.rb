require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { Post.create(author: user, title: 'Test Post') }

  describe 'GET /index' do
    before do
      get user_posts_path(user)
    end
  end
end
