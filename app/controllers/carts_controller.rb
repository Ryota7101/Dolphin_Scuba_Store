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
  
  # 商品一覧画面から、「商品購入」を押した時のアクション
 
  def add_item
    if CartItem.find_by(product_id: params[:product_id], cart_id: current_cart.id).blank?
    #if @cart_item.blank?
      #追加した商品が初めてカートに入れるなら、cart_itemsを作成する
      @cart_item = current_cart.cart_items.create(product_id: params[:product_id])
    end
    
    @cart_item.quantity += params[:product][:quantity].to_i
    @cart_item.save!
    redirect_to current_cart
  end


  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    #debugger
    @cart_item.destroy
    redirect_to current_cart
    
  end

  def delete_item
    #debugger
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: params[:product_id])
  end
end