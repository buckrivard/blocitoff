class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

  def create
  	@item = Item.new
  	@item.update(post_params)
  	@item.user_id = current_user.id

  	if @item.save
  		flash[:notice] = "Item added. You have 7 days to complete it!"
  	else
  		flash[:alert] = "Error creating your item. Let's try it again."
  	end
  	redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "#{@item.name} complete!"
    else
      flash[:alert] = "Problem marking task complete. Try again."
    end
    redirect_to authenticated_root_path
  end

  private

  def post_params
  	params.require(:item).permit(:name)
  end

end
