class InventoriesController < ApplicationController
  def index
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      flash[:notice] = "\"#{@inventory.style}\" has been added!"
      redirect_to inventories_path
    else
      flash.now[:alert] = "There was an error adding the item. Please try again."
      render :new
    end
  end

  def search
    if params[:search]
      @inventories = Inventory.where("style LIKE ? OR category LIKE ? OR size LIKE ? OR color LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @inventories = [];
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:style, :category, :brand_id, :price, :size, :color)
  end
end
