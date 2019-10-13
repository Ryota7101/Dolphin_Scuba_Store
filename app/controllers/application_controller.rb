class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  
  #loginメソッドやcurrent_userメソッドを読み込む
  include SessionsHelper
  
  private
    
    def current_cart
      @current_cart = Cart.find_by(user_id:current_user.id)
    end
  
end