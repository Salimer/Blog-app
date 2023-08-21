class PostsController < ApplicationController
    def index
        @posts = @user.posts
    end

    def show
        
    end

end
