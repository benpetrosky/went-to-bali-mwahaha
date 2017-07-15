class ProductsController < ApplicationController
  # before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new

    respond_to do |format|
      format.html {redirect_to products_path}
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added succesfully!"
      respond_to do |format|
        format.html
        format.js {redirect_to products_path}
      end
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
