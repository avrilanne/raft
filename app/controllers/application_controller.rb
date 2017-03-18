class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @_current ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def set_user(user)
    session[:user_id] = user.id
  end
end
