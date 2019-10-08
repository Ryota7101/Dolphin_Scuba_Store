class RemoveCartidFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cart_id, :integer
  end
end
