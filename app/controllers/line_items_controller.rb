class LineItemsController < ApplicationController
before_action :authenticate_user!

  def create
    current_user.current_cart_create if current_cart.nil?
    line_item = current_cart.add_item(params[:item_id])

    if line_item.save
      redirect_to cart_path(current_cart), notice: "Item added to cart!"
    else
      redirect_to store_path, notice: "Unable to add item"
    end
  end

end
