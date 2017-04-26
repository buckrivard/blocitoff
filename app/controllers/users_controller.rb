class UsersController < ApplicationController

  def show
  	@item = Item.new
  	@items = current_user.items
  end
  
end
