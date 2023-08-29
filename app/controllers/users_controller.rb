class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:show]

  def index
    @users = User.includes(:posts).all
  end

  def show
    if @user.nil?
      @users = User.includes(:posts).all
      render 'index'
    end
    @three_recent_posts = @user.three_most_recent_posts unless @user.nil?
  end

  def new; end

  def find_user
    @user = User.find(params[:id]) unless User.exists?
  rescue ActiveRecord::RecordNotFound
    # Handle the situation when the post is not found
    flash[:alert] = 'User not found, back to users page'
    redirect_to users_path
  end
end
