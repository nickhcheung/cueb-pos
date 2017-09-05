class ChangeTotalToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :sales, :total, :float
  end
end
