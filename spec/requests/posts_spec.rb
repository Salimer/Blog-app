require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { Post.create(author: user, title: 'Test Post') }

  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
