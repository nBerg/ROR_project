class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user] = user
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = "Invalid email"
      render "new"
    end  
  end

  def destroy
    reset_session 
    redirect_to root_url
  end

end
