class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id:current_user.id)
  end

  def show
  end

  def new
  	@order = Order.new
  end

  def create
    @cart_items = CartItem.where(cart_id:current_cart.id)
    @order = Order.create(order_params)
    #@order.add_items_to_order(current_cart)
    @cart_items_order = @cart_items.clone
    
    
    @cart_items_order.each do |item|
      item.order_id = @order.id
    end
    debugger
    @cart_items.each do |item|
      item.clear
    end
    debugger
    
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
