class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item, :show]

  def show
    #@cart_items = current_cart.cart_items
    #debugger
    #debugger
    #@cart = Cart.find(params[:id])
    #@cart_items = CartItem.find_by(cart_id:@cart.id)
    
    #@user  = User.find_by(id:@house.user_id)
    #@cart = Cart.find_by(user_id:current_user.id) #現在のユーザーが持つカートを探す
    @cart_items = CartItem.where(cart_id: current_cart.id)
    
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
    redirect_to root_url
  end


  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    #@cart = Cart.find_by(user_id:current_user.id) #現在のユーザーが持つカートを探す
    
    #現在のユーザーが持つカートに入っている商品と個数を探す
    #todo カートid1に対して複数種類の商品がある場合に全て取り出しているか
    @cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: params[:product_id])
    #debugger
    
    #@cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end