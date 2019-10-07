class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  #ユーザーアカウントを作成
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Dolphin Scuba Storeへようこそ"
      @user.create_cart #カートも作成する
      redirect_to @user
    else
      render 'new'
    end
  end
  
  #ユーザープロフィールを編集
  def edit
    @user = User.find(params[:id])
  end
  
  #編集したプロフィールを更新
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  #ユーザーを削除(管理者のみ)
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    #現在閲覧しているユーザーページとログインしているユーザーが異なれば
    #トップページへリダイレクトする
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    #管理者でなければトップページにリダイレクトする
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
