module CartsHelper

  def current_cart
    @current_cart ||= current_user.current_cart
  end

end
