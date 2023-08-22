require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { User.create(name: 'Test User') }

  describe 'GET /index' do
    before do
      get users_path
    end

    context 'renders the index template' do
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'correct template is rendered' do
        expect(response).to render_template(:index)
      end
      it 'the response body includes correct placeholder text' do
        expect(response.body).to include('Users')
      end
    end
  end

  describe 'GET #show' do
    before do
      get user_path(user)
    end

    context 'renders the show template' do
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'correct template is rendered' do
        expect(response).to render_template(:show)
      end
      it 'the response body includes correct placeholder text' do
        expect(response.body).to include('Test User')
      end
    end
  end
end
