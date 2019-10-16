class CartItemsController < ApplicationController
  before_action :setup_item, only: [:destroy]

  def destroy
    #@cart_item.destroy
    CartItem.find(params[:id]).destroy
    redirect_to current_cart
  end
  
  private

    def setup_item
      @setup_item = CartItem.find(params[:id])
    end
end
