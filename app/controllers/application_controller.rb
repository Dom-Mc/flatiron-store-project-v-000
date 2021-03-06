class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CartsHelper

  protected

    # NOTE: Change/Configure redirect path after sign_out (via Devise)
    def after_sign_out_path_for(resource_or_scope)
      store_path
    end

end
