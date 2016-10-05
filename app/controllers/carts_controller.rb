class CartsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_cart, only: [:show, :checkout]

  def show
    if @cart.user == current_user
      render :show
    else
      redirect_to new_user_session_path
    end
  end

  def checkout
    @cart.complete_checkout
    redirect_to @cart
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

end
