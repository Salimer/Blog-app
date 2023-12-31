class CommentsController < ApplicationController
  before_action :find_user
  before_action :find_post
  before_action :find_comment, only: :destroy

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = @user # Assign the current user to the comment
    if @comment.save
      flash[:notice] = 'Comment created successfully.'
      redirect_to user_post_path(@post.author, @post)
    else
      render 'new'
    end
  end

  def destroy
    authorize! :delete, @comment

    if @comment.destroy
      flash[:notice] = 'Comment was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete comment.'
    end

    redirect_to user_post_path(@user, @post)
  end

  private

  def find_user
    @user = current_user
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
