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
  after_save :increase_user_posts_counter
  after_destroy :decrease_user_posts_counter

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Methods
  def increase_user_posts_counter
    author.increment!(:posts_counter)
  end

  def decrease_user_posts_counter
    author.decrement!(:posts_counter)
  end

  def five_most_recent_comments
    comments.includes(:author).order(created_at: :asc).limit(5)
  end
end
