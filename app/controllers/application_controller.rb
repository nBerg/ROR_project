class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user
  helper_method :current_user, :logged_in?, :admin?, :current_user?

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

  def require_admin
    if @current_user.role == 'Admin'
      return true
    end
    redirect_to root_url
  end

  def admin?
    @current_user.role == 'Admin'
  end

  def current_user?(user)
    user == @current_user
  end

end
