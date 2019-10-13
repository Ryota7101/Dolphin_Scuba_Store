class User < ApplicationRecord
  has_one :cart #ユーザーとカートを関連つけるために追加
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  
  def send_order_email
    cart_items = CartItem.where(cart_id:current_cart.id)
    UserMailer.order_check(self,cart_items,11).deliver_now
  end
  
end
