class UsersController < ApplicationController

  def new
  end

  def index
    @users = User.search(params[:search])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_user(@user)
      redirect_to user_path(@user)
    else
      render 'new', status: 422
    end

  end

  def show
    @show_user = find_user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
  def find_user
    @user = User.find_by(id: params[:id])
  end
end
