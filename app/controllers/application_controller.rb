class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  helper_method :current_user_order
  
  #loginメソッドやcurrent_userメソッドを読み込む
  include SessionsHelper
  
  private
    
    def current_cart
      @current_cart = Cart.find_by(user_id:current_user.id)
    end
    
    def current_user_order
      @current_order = Order.where(user_id:current_user.id)
    end
  
end