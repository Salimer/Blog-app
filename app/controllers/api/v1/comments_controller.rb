class Api::V1::CommentsController < ActionController::API
  before_action :find_user_and_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = @user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
