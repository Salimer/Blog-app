require 'rails_helper'

RSpec.feature "User Index", type: :feature do
  scenario 'visiting the user index page' do
    user1 = User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')
    user2 = User.create(name: 'Ali', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

    visit users_path

    expect(page).to have_content("Tom")
    expect(page).to have_content("Ali")
    expect(page).to have_css("img[alt='Tom']", count: 1)
    expect(page).to have_css("img[alt='Ali']", count: 1)
  end

  scenario 'visiting the user index page, you see the number of posts each user has written..' do
    user1 = User.create(name: 'Tom')
    user2 = User.create(name: 'Ali')
    post1 = Post.create(author: user1, title: 'first post')
    post2 = Post.create(author: user1, title: 'second post')
    post3 = Post.create(author: user1, title: 'third post')

    visit users_path

    expect(page).to have_content("3")
    expect(page).to have_content("0")
  end

  scenario 'clicking on a user redirects to their show page' do 
    user = User.create(name: 'Salim')

    visit users_path

    click_link 'Salim'

    expect(page).to have_current_path(user_posts_path(user))
  end
end