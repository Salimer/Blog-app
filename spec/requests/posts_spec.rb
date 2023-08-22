require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { Post.create(author: user, title: 'Test Post') }

  describe 'GET /index' do
    before do
      get user_posts_path(user)
    end

    context 'renders the index template' do
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'correct template is rendered' do
        expect(response).to render_template(:index)
      end
  end
  end
end
