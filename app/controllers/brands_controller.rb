class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new
    @brand.name = params[:brand][:name]

    if @brand.save
      flash[:notice] = "\"#{@brand.name}\" has been added to Brands!"
      redirect_to brands_path
    else
      flash.now[:alert] = "There was an error adding the Brand. Please try again."
      render :new
    end
  end

  def destroy
    @brand = Brand.find(params[:id])

    if @brand.destroy
      flash[:notice] = "\"#{@brand.name}\" was deleted successfully."
      redirect_to brands_path
    else
      flash.now[:alert] = "There was an error deleting the brand."
      render brands_path
    end
  end
end
