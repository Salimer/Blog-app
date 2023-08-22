require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { User.create(name: 'Test User') }

  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
