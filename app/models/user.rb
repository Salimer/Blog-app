class User < ApplicationRecord
  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # Attributes
  attribute :name, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0
  attribute :photo, :string

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Methods
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
