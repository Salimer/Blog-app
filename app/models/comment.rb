class Comment < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Attributes
  attribute :text, :text

  # Callbacks
  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter

  # Methods
  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
