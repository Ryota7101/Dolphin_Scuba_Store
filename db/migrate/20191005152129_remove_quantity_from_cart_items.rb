class RemoveQuantityFromCartItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :cart_items, :quantity, :interger
  end
end
