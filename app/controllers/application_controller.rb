class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #loginメソッドやcurrent_userメソッドを読み込む
  include SessionsHelper
end
