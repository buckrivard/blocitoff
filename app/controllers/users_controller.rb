class UsersController < ApplicationController

  def show
  	@user = current_user
  	@item = Item.new
  	@items = Item.all
  end
  
end
