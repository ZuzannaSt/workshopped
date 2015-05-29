class HomeController < ApplicationController
  expose(:categories)
  expose(:products)

  def index
    @category = Category.first
    @product = @category.products.first
  end

end
