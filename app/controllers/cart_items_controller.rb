class CartItemsController < ApplicationController
  before_action :setup_item, only: [:destroy]
  
  
  def destroy
    debugger
    @setup_item.destroy
    redirect_to current_cart
    
  end

  def delete_item
    debugger
    @setup_item.destroy
    redirect_to current_cart
  end
  
  private

    def setup_item
      #@cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: params[:product_id])
      @setup_item = CartItem.find(params[:id])
    end
end
