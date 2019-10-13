class RemoveOrderIdFromCartItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :cart_items, :order_id, :integer
  end
end
