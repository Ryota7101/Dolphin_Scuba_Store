class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
  	@order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @cart_items = CartItem.where(cart_id:current_cart.id)
    redirect_to current_cart
  end

  def destroy
    @order.destroy
  
  end
  
  private
  
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email)
    end
end
