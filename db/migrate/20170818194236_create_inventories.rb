class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :style
      t.string :class
      t.string :color
      t.string :size
      t.integer :price
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
