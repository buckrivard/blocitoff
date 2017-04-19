class ItemsController < ApplicationController
  def create
  	@item = Item.new
  	@item.update(post_params)
  	@item.user_id = current_user.id

  	if @item.save
  		flash[:notice] = "Item added. You have 7 days to complete it!"
  end
end
