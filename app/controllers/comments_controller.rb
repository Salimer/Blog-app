class CommentsController < ApplicationController
    before_action :find_user
    before_action :find_post

end
