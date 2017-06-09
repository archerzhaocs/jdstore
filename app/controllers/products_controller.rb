class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def ordering
    @product = Product.find(params[:id])

    if @product.quantity < 1
      flash[:alert] = "该保险已被抢购一空"
      redirect_to :back
      return
    end

    # 清空购物车，保持只有一个商品。
    current_cart.clean!
    current_cart.add_product_to_cart(@product)

    # 直接下单
    redirect_to new_order_path
  end


end
