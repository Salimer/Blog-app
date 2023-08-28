require 'rails_helper'

RSpec.feature "Post Index", type: :feature do
  scenario "see user's profile picture and username" do
    user = User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

    visit user_posts_path(user)

    expect(page).to have_content("Tom")
    expect(page).to have_css("img[alt='Tom']", count: 1)
  end
end
