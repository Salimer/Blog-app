class PostsController < ApplicationController
    def index
        @posts = @user.posts
    end
end
