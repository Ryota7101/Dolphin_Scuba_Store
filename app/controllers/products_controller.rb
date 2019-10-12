class ProductsController < ApplicationController
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
      # Sucess
      flash[:success] = "商品を登録しました"
      redirect_to root_url
    else
      # Failure
      render 'new'
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
  
  private

    def product_params
      params.require(:product).permit(:name, :price)
      params.require(:product).permit(:title, :memo, :author, :picture)
    end
end
