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

  scenario "see some of the post's body" do
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

    expect(page).to have_content("Lorem Ipsum is simply dummy text of the printing")
    expect(page).not_to have_content(body)
  end

  scenario 'see the first comments' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")
    comment1 = Comment.create(author: user, post: post, text: 'first comment')
    comment2 = Comment.create(author: user, post: post, text: 'second comment')
    comment3 = Comment.create(author: user, post: post, text: 'third comment')
    comment4 = Comment.create(author: user, post: post, text: 'fourth comment')
    comment5 = Comment.create(author: user, post: post, text: 'fifth comment')
    comment6 = Comment.create(author: user, post: post, text: 'sixth comment')

    visit user_posts_path(user)

    expect(page).to have_content("first comment")
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

    visit user_posts_path(user)

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

    visit user_posts_path(user)

    expect(page).to have_content("Likes: 6")
  end

  scenario 'see how many likes a post has' do
    user = User.create(name: 'Tom')
    post = Post.create(author: user, title: "first post's title")
    comment = Comment.create(author: user, post: post, text: 'first comment')
    like = Like.create(author: user, post: post)

    visit user_posts_path(user)

    expect(page).to have_content("Pagination")
  end

end
