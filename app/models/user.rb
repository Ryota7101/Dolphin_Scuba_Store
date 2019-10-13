class User < ApplicationRecord
  has_one :cart #ユーザーとカートを関連つけるために追加
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def send_order_email
    UserMailer.order_check(self).deliver_now
  end
  
end
