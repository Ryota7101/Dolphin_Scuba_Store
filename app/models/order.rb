class Order < ApplicationRecord
  has_many :cart_item, dependent: :destroy

  has_one :order_product
end
