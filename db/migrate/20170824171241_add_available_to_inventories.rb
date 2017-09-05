class AddAvailableToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :available, :boolean, default: true
  end
end
