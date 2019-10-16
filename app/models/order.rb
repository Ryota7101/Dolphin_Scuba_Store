class Order < ApplicationRecord
  has_many :cart_item, dependent: :destroy
  has_many :order_products
  has_one :users
  
  enum status: { waiting_for_payment: 0, waiting_for_shipping: 1,  shipment_complete: 2}
  
  def toggle_status!
    if waiting_for_payment?
      waiting_for_shipping!
    elsif waiting_for_shipping? || shipment_complete?
      shipment_complete!
    end
  end
end
