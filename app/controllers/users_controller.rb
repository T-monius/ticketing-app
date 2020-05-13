class UsersController < ApplicationController
  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    binding.pry
    if @user.save
      flash[:notice] = 'User was created.'
      redirect_to '/'
    else
      flash[:error] = 'Could not create user.'
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end