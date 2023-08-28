require 'rails_helper'

RSpec.feature "Post Show", type: :feature do
  scenario 'see the title of the post' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")

    visit user_post_path(user, post)

    expect(page).to have_content("first post's title")
  end

  scenario 'see who wrote the post' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")

    visit user_post_path(user, post)

    expect(page).to have_content("by Tom")
  end

  scenario 'see how many comments a post has' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")
    comment1 = Comment.create(author: user, post: post, text: 'first comment')
    comment2 = Comment.create(author: user, post: post, text: 'second comment')
    comment3 = Comment.create(author: user, post: post, text: 'third comment')
    comment4 = Comment.create(author: user, post: post, text: 'fourth comment')
    comment5 = Comment.create(author: user, post: post, text: 'fifth comment')
    comment6 = Comment.create(author: user, post: post, text: 'sixth comment')

    visit user_post_path(user, post)

    expect(page).to have_content("Comments: 6")
  end

end
