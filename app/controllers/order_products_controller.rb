class OrderProductsController < ApplicationController
  def create
    @order = Order.create(order_product_params)
  end
  
  private
    def order_product_params
      params.require(:order).permit(:name, :address, :email)
    end
end
