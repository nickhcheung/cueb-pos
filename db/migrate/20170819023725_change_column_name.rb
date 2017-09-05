class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :inventories, :class, :category
  end
end
