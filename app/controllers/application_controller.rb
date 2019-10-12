class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  
  #loginメソッドやcurrent_userメソッドを読み込む
  include SessionsHelper
  
  private
    
    def current_cart
      @current_cart = Cart.find_by(user_id:current_user.id)
      #@current_cart ||= User.find(session[:user_id]) if session[:user_id]
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