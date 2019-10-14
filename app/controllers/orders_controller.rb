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
    
    @total_price = 0
    if @cart_items
      @cart_items.each do |cart_item|
        #debugger
        @total_price += cart_item.product.price * cart_item.quantity
      end
      #debugger
    end
    
    UserMailer.order_check(current_user,@cart_items,@total_price).deliver_now
    flash[:info] = "ご注文ありがとうございます。ご注文内容をメールで送信しました"
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
