class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user
  helper_method :current_user, :logged_in?

  def current_user
    if @current_user.nil?
      @current_user = User.find(session[:user_id]) if session[:user]
    end
  end

  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end

  def logged_in?
    @current_user != nil
  end

end
