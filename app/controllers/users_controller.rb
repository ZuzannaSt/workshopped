class UsersController < ApplicationController
  expose_decorated(:user)
  expose(:reviews)

  def show
  end

end
