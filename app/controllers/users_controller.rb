class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to te Alpha-Blog! #{@user.username}"
      redirect_to articles_path
    else
      render 'new' #this goes back to the page to display the error messages
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end