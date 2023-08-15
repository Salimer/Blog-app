class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Callbacks
  after_save :update_post_likes_counter

  # Methods
  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
