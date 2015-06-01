class HomeController < ApplicationController
  
  def index
    @category = Category.first
    @product = @category.products.first
  end

end
