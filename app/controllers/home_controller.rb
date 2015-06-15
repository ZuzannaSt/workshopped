class HomeController < ApplicationController

  def index
    @category = Category.first
    @product = @category.products.first
    
    @count_categories = Category.count
    @count_products = Product.count
    @count_reviews = Review.count
  end

end
