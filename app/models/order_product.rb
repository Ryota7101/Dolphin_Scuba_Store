class OrderProduct < ApplicationRecord
  has_many :users
  belongs_to :order
  has_many :products
  
  
  
end
