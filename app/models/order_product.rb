class OrderProduct < ApplicationRecord
  has_many :users
  has_many :orders
  has_many :products
  
end
