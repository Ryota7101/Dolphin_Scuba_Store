class AddQuantityFromCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :quantity, :interger, default: 0
  end
end
