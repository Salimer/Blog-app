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

  scenario 'see how many likes a post has' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")
    like1 = Like.create(author: user, post: post)
    like2 = Like.create(author: user, post: post)
    like3 = Like.create(author: user, post: post)
    like4 = Like.create(author: user, post: post)
    like5 = Like.create(author: user, post: post)
    like6 = Like.create(author: user, post: post)

    visit user_post_path(user, post)

    expect(page).to have_content("Likes: 6")
  end

  scenario "see the post's body" do
    body = "Lorem Ipsum is simply dummy text of the printing and typesetting
    industry. Lorem Ipsum has been the industry's standard dummy text ever since
    the 1500s, when an unknown printer took a galley of type and scrambled it to
    make a type specimen book. It has survived not only five centuries, but also
    the leap into electronic typesetting, remaining essentially unchanged.
    It was popularised in the 1960s with the release of Letraset sheets containing
    Lorem Ipsum passages, and more recently with desktop publishing software like
    Aldus PageMaker including versions of Lorem Ipsum."

    user = User.create(name: 'Tom')
    post1 = Post.create(author: user, title: "first post's title", text: body)

    visit user_posts_path(user)

    expect(page).not_to have_content(body)
  end

end
