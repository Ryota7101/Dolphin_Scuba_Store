class Cart < ApplicationRecord
  belongs_to :user #ユーザーとカートを関連つけるために追加
  has_many :cart_items
  
end
