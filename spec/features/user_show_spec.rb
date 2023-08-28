require 'rails_helper'

RSpec.feature "User Show", type: :feature do
  scenario 'visiting the user Show page' do
    user1 = User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

    visit user_path(user1)

    expect(page).to have_content("Tom")
    expect(page).to have_css("img[alt='Tom']", count: 1)    
  end

  scenario 'visiting the user show page, you see the number of posts the user has written..' do
    user1 = User.create(name: 'Tom')
    post1 = Post.create(author: user1, title: 'first post')
    post2 = Post.create(author: user1, title: 'second post')
    post3 = Post.create(author: user1, title: 'third post')

    visit user_path(user1)

    expect(page).to have_content("3 posts")
  end
  
  scenario 'visiting the user show page, you see the 3 most recent post and bio of the user has written..' do
    user1 = User.create(name: 'Tom', bio: "He is a good programmar")
    post1 = Post.create(author: user1, title: 'first post', text: 'first text')
    post2 = Post.create(author: user1, title: 'second post', text: 'second text')
    post3 = Post.create(author: user1, title: 'third post',text: '3 text' )
    post4 = Post.create(author: user1, title: '4 post',text: '4 text')


    visit user_path(user1)

    expect(page).to have_content("He is a good programmar")
    expect(page).to have_content('second text')
    expect(page).not_to have_content("fist text")
    expect(page).to have_content("3 text")
    expect(page).to have_content("4 text")

  end


#   scenario 'clicking on a user redirects to their show page' do 
#     user = User.create(name: 'Salim')
#     user1 = User.create(name: 'Tom')

#     visit user_path(user1)

#     click_link 'Tom'

#     expect(page).to have_current_path(users)
#   end

# it 'has a link to the user index page' do
#     user = User.create(name: 'Salim')
#     visit user_path(user)

#     click_link '⬅'

#     expect(current_path).to eq(users_path)
#   end




it 'has a link to the user index page' do
   user = User.create(name: 'Salim')
   post1 = Post.create(author: user, title: 'first post', text: 'first text')

   visit user_path(user)

   expect(page).to have_button('See all posts')
   click_link 'See all posts'
   expect(current_path).to eq(user_posts_path(user))
end

# scenario 'clicking a user post redirects to post show page' do
#     user = User.create(name: 'Alice')
#     post = Post.create(author: user, title: 'A Post', text: 'Some content')

#     visit user_path(user)
#     click_link 'A Post' # Adjust this link text to match your actual post's content

#     expect(current_path).to eq(user_post_path(user, post))
#   end


end
