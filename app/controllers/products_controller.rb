class ProductsController < ApplicationController
  before_action :ensure_correct_user, {only: [:new,
                                              :create,
                                              :edit,
                                              :destroy]}
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save # => Validation
      flash[:success] = "商品を登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "更新しました"
      redirect_to @product
    else
      render 'edit'
    end
  end
  
  def ensure_correct_user
    if current_user.admin?
      #何もしない
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "商品を削除しました"
    redirect_to products_path
  end
  
  def ensure_correct_user
    if current_user.admin?
      #何もしない
    else
      flash[:notice] = "アクセス権限がありません"
      redirect_to root_url
    end
  end
  
  private

    def product_params
      params.require(:product).permit(:name, :price, :title, :memo, :author, :picture)
      #params.require(:product).permit(:title, :memo, :author, :picture)
    end
end
