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
  end
  end
end
