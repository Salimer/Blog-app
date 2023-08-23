class CommentsController < ApplicationController
    before_action :find_user
    before_action :find_post

    def new
        @comment = @post.comments.new
    end

end
