class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      set_user(user)
      redirect_to user_path(user)
    else
      @errors = ["Login Failed"]
      render '/welcome/index' , status: 422
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
