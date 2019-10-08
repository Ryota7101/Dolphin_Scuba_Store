class RemoveCartIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cart_id, :integer
    #remove_column :blogs, :category_id, :integer
  end
end
