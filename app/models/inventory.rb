class Inventory < ApplicationRecord
  belongs_to :brand
  has_one :sale
end
