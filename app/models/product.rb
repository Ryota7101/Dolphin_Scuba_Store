class Product < ApplicationRecord
  has_many :carts, through: :cart_items
end
