class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :total
      t.references :employee, foreign_key: true
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
