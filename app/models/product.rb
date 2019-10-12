class Product < ApplicationRecord
  has_many :carts, through: :cart_items
  mount_uploader :picture, PictureUploader
end
