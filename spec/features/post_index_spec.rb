require 'rails_helper'

RSpec.feature "Post Index", type: :feature do
  scenario "see user's profile picture and username" do
    user = User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

    visit user_posts_path(user)

    expect(page).to have_content("Tom")
    expect(page).to have_css("img[alt='Tom']", count: 1)
  end

  scenario 'see the number of posts the user has written.' do
    user = User.create(name: 'Tom')
    post1 = Post.create(author: user, title: 'first post')
    post2 = Post.create(author: user, title: 'second post')
    post3 = Post.create(author: user, title: 'third post')

    visit user_posts_path(user)

    expect(page).to have_content("3 posts")
  end

  scenario 'see the title of the post' do
    user = User.create(name: 'Tom')
    post1 = Post.create(author: user, title: "first post's title")

    visit user_posts_path(user)

    expect(page).to have_content("first post's title")
  end

end
