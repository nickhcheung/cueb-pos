class Employee < ApplicationRecord
  has_many :sales
  has_many :inventories, through: :sales
end
