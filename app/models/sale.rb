class Sale < ApplicationRecord
  belongs_to :employee
  belongs_to :inventory
end
