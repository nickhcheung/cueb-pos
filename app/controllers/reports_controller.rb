class ReportsController < ApplicationController
  def index
  end

  def sales
    @sales = Sale.all
  end

  def sold
    @inventories = Inventory.where(available: false)
  end
end
