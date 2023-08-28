require 'rails_helper'

RSpec.feature "User Index", type: :feature do
  scenario 'visiting the user index page' do
    user1 = User.create(name: 'Tom')
    user2 = User.create(name: 'Ali')

    visit users_path

    expect(page).to have_content("Tom")
    expect(page).to have_content("Ali")
    expect(page).to have_css("img[alt='Tom'], count: 1")
    expect(page).to have_css("img[alt='Ali'], count: 1")
  end

  scenario 'visiting the user index page, you see the number of posts each user has written..' do
    user1 = User.create(name: 'Tom', posts_counter: 2 )
    user2 = User.create(name: 'Ali', posts_counter: 1 )

    visit users_path

    expect(page).to have_content("2")
    expect(page).to have_content("1")
  end
end
