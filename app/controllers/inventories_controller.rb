class InventoriesController < ApplicationController
  def index
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new
    @inventory.style = params[:inventory][:style]
    @inventory.category = params[:inventory][:category]
    @inventory.color = params[:inventory][:color]
    @inventory.size = params[:inventory][:size]
    @inventory.price = params[:inventory][:price]
    @inventory.brand_id = params[:inventory][:brand_id]

    if @inventory.save
      flash[:notice] = "\"#{@inventory.style}\" has been added!"
      redirect_to inventories_path
    else
      flash.now[:alert] = "There was an error adding the item. Please try again."
      render :new
    end
  end
end
