class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :content, :user_id, presence: true
end
