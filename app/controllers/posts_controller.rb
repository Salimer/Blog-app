class PostsController < ApplicationController
    def index
        @posts = @user.posts
    end

    def show
        
    end

    def new

    end

end
