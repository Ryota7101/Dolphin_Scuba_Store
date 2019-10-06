class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  
  #loginメソッドやcurrent_userメソッドを読み込む
  include SessionsHelper
  
  private
  
    def current_cart
      #debugger
      # sessionはハッシュのようにアクセスできる
      begin
        Cart.find(session[:cart_id])
        #debugger
      rescue ActiveRecord::RecordNotFound
        # 新しいカートを作成する(DBも書き込む)
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
        #debugger
      end
    end
=begin
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      debugger
    else
      cart = Cart.new
      session[:cart_id] = cart.id
      debugger
    end
  end
=end
  
end