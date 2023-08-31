class Api::V1::PostsController < ActionController::API
  before_action :find_user

  def index
    @posts = @user.posts
    render json: @posts
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
