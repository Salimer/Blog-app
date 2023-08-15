class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Methods
  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
