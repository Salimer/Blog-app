require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { User.create(name: 'Test User') }

  describe 'GET /index' do
    before do
      get users_path
    end

    context 'renders the index template' do
  end
  end
end
