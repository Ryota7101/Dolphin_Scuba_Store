class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    #@cart_items = current_cart.cart_items
    #debugger
    @cart = Cart.find(params[:id])
    @cart_items = CartItem.find_by(cart_id:@cart.id)
    debugger
    #@user  = User.find_by(id:@house.user_id)
  end

  
  
  # 商品一覧画面から、「商品購入」を押した時のアクション 
=begin
  def create
    @cart_item = Cart_item.new(cart_item_params)
    if @cart_item.save # => Validation
      # Sucess
      flash[:success] = "商品をカートに入れました"
      redirect_to root_url
    else
      # Failure
      render 'new'
    end
  end
=end
 
  def add_item
    if @cart_item.blank?
      #追加した商品が初めてカートに入れるなら、cart_itemsを作成する
      @cart.cart_items.build(product_id: params[:product_id])
    end
    
    debugger
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
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
    @cart = Cart.find_by(user_id:current_user.id) #現在のユーザーが持つカートを探す
    #cart = Cart.find(params[:cart_id])
    
    #現在のユーザーが持つカートに入っている商品と個数を探す
    #todo カートid1に対して複数種類の商品がある場合に全て取り出しているか
    @cart_item = CartItem.find_by(cart_id: @cart.id)
    debugger
    
    #@cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end