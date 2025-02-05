class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def index
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

end
