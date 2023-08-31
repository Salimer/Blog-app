class Api::V1::CommentsController < ActionController::API
    before_action :find_user_and_post
  
    def index
      @comments = @post.comments
      render json: @comments
    end

    def find_user_and_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end
  end
  