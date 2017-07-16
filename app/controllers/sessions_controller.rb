class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "You are now signed in"
    else
      flash[:notice] = "There was an issue with your log in. You are not signed in."
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now signed out."
    redirect_to '/sign_in'
  end

end
