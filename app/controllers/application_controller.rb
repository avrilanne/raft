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

  def highest_choice(poll)
      @num = 0
      @highest_name = ''
      poll.choices.each do |choice|
        if choice.answers.count > @num
          @num = choice.answers.count
          @highest_name = choice.title
        end
      end
    return "#{@highest_name}"
  end
end
