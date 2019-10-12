class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @cart = current_cart
  	if @cart.line_items.empty?
  		redirect_to market_url, notice: 'カートは空です。'
  		#return
  	end
  
  	@order = Order.new
  end

  def create
    @order = Order.new(order_params)
    current_cart.delete
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email)
    end
end
