class UserMailer < ApplicationMailer
  def order_check(user)
    @user = user
    mail to: user.email, subject: "ご注文内容"
  end
end