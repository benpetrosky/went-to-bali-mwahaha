class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)

    if @order.save
      flash[:notice] = "The product has been added to your cart!"
      respond_to do |format|
        format.html
        format.js


      end

    session[:order_id] = @order.id

    else
      flash[:notice] = "There was an issue placing your order. Please try again soon, or contact our customer service department."
      redirect_to products_path
    end
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])

    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    flash[:notice] = "The product has been removed from your cart!"
    respond_to do |format|
      format.html
      format.js
    end


  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
