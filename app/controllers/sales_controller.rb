class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @inventories = Inventory.where(available: true)
    @employees = Employee.all
    @discount = 0

    if params[:id]
      @item = Inventory.find(params[:id])
      @sale.inventory_id = @item.id
    else
      @item = nil
    end

    if params[:discount]
      @discount = @item.price * (params[:discount].to_i / 100.to_f)
      @discounted_price = @item.price - @discount
      @total = @discounted_price * 1.12
      @sale.total = @total
    else
      @discount = 0
    end
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      flash[:notice] = "Sale has been completed!"
      Inventory.update(@sale.inventory_id, :available => false)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error completing the sale. Please try again."
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:total, :inventory_id, :employee_id)
  end
end
