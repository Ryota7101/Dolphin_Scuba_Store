class AddStatusToOrderProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :order_products, :status, :integer, default: 0
  end
end
