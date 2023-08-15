class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Attributes
  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  # Callbacks
  after_save :update_user_posts_counter

  # Methods
  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
