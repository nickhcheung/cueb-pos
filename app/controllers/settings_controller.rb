class SettingsController < ApplicationController
  def index
  end

  def reset
    Brand.delete_all
    Employee.delete_all
    Inventory.delete_all
    Sale.delete_all
  end
end
