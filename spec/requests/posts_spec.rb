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
      it 'the response body includes correct placeholder text' do
        expect(response.body).to include('posts')
      end
    end
  end

  describe 'GET #show' do
    before do
      get user_post_path(user, post)
    end

    context 'renders the show template' do
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'correct template is rendered' do
        expect(response).to render_template(:show)
      end
      it 'the response body includes correct placeholder text' do
        expect(response.body).to include('Post #')
      end
    end
  end
end
