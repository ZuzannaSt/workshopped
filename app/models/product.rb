class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, -> { order "rating DESC" }

  validates :title, :description, :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    reviews.map(&:rating).sum.to_f / reviews.count
  end
end
