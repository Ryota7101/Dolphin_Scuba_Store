class User < ApplicationRecord
  has_one :cart #ユーザーとカートを関連つけるために追加
  has_many :orders
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
end
