class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_user(@user)
      redirect_to user_path(@user)
    end
  end





private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

end
