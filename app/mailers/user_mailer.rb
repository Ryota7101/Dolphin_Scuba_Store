class UserMailer < ApplicationMailer
  def order_check(user,cart_item,total_price)
    @user = user
    @cart_items = cart_item
    @total_price = total_price
    mail to: user.email, subject: "CHU-MON"
  end
end