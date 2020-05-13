class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(name: params[:name]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    else
      flash.now[:error] = 'Could not login with those credentials.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out."
    redirect_to root_path
  end
end