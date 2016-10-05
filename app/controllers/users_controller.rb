class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to new_user_session_path
    end
  end

end
