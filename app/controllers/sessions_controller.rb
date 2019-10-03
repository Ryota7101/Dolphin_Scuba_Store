class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #authenticateメソッドは認証に失敗したときにfalseを返す
    if user && user.authenticate(params[:session][:password])
      log_in user #session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = '無効なメール/パスワードの組み合わせ'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
