class Category < ActiveRecord::Base
  has_many :products, -> { order "title ASC" }

  validates :name, presence: true, uniqueness: true
end
