require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', bio: 'He is a good programmar') }
  let!(:post1) { Post.create(author: user, title: 'first post', text: 'first text') }
  let!(:post2) { Post.create(author: user, title: 'second post', text: 'second text') }
  let!(:post3) { Post.create(author: user, title: 'third post', text: '3 text') }
  let!(:post4) { Post.create(author: user, title: '4 post', text: '4 text') }

  scenario 'visiting the user Show page' do
    visit user_path(user)

    expect(page).to have_content('Tom')
    expect(page).to have_css("img[alt='Tom']", count: 1)
  end

  scenario 'visiting the user show page, you see the number of posts the user has written..' do
    visit user_path(user)

    expect(page).to have_content('4 posts')
  end

  scenario 'visiting the user show page, you see the 3 most recent post and bio of the user has written..' do
    visit user_path(user)
    expect(page).to have_content('He is a good programmar')
    expect(page).not_to have_content('fist text')
  end

  scenario 'has a link to the user index page' do
    visit user_path(user)

    expect(page).to have_button('See all posts')
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end

  scenario 'clicking a user post redirects to post show page' do
    visit user_path(user)
    click_link 'second text' # Adjust this link text to match your actual post's content
    expect(current_path).to eq(user_post_path(user, post2))
  end
end
