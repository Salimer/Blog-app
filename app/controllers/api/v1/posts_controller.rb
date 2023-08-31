class Api::V1::PostsController < ActionController::API
    before_action :find_user
    private
  
    def find_user
      @user = User.find(params[:user_id])
    end
  end
  