class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item, :show]

  def show
    @cart_items = CartItem.where(cart_id:current_cart.id)
    @total_price = 0
    if @cart_items
      @cart_items.each do |cart_item|
        @total_price += cart_item.product.price * cart_item.quantity
      end
    end
  end
 
  def add_itemx
    if CartItem.find_by(product_id: params[:product_id], cart_id: current_cart.id).blank?
      #追加した商品が初めてカートに入れるなら、cart_itemsを作成する
      @cart_item = current_cart.cart_items.create(product_id: params[:product_id])
    end
    
    @cart_item.quantity += params[:product][:quantity].to_i
    @cart_item.save!
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
    
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: params[:product_id])
  end
end