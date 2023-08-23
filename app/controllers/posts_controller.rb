class PostsController < ApplicationController
  before_action :find_user, only: %i[index show like unlike]
  before_action :find_post, only: [:show, :like, :unlike]

  def index
    @posts = @user.posts
  end

  def show; end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def like
    @like = @post.likes.new()
    @like.author = current_user
    @like.save
    redirect_to user_post_path(@user, @post)
  end
  

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Handle the situation when the post is not found
    flash[:alert] = 'Post not found, back to posts page'
    redirect_to user_posts_path(@user)
  end
end
