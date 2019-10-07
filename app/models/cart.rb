class Cart < ApplicationRecord
  #has_many :cart_items
  belongs_to :user #ユーザーとカートを関連つけるために追加
  has_many :products, through: :cart_items
end
