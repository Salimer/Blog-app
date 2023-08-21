class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show; end

  def new; end

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Handle the situation when the post is not found
    flash[:alert] = 'User not found, back to users page'
    redirect_to users_path
  end
end
