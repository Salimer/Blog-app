require 'rails_helper'

RSpec.feature "Post Show", type: :feature do
  scenario 'see the title of the post' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")

    visit user_post_path(user, post)

    expect(page).to have_content("first post's title")
  end

end
