class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

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
        format.js 
      end
    else
      flash[:notice] = "Product was not added succesfully. Validations may have not been fullfilled.  See your management handbook for details."
      redirect_to products_path
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "The product has succesfully been removed from the website."

    redirect_to products_path
  end

  def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    flash[:notice]= "The product has been updated"
    redirect_to products_path
  else
    flash[:notice] = "There was an issue! The update you tried to make has not been saved"
  redirect_to product_path(@product)
  end
end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
