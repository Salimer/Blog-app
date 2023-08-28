require 'rails_helper'

RSpec.feature "User Index", type: :feature do
  scenario 'visiting the user index page' do
    user1 = User.create(name: 'Tom')
    user2 = User.create(name: 'Ali')

    visit users_path

    expect(page).to have_content("Tom")
    expect(page).to have_content("Ali")
  end
end
