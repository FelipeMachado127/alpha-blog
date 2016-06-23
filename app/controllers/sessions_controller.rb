class SessionsController < ApplicationController
  def new 
    redirect_to articles_path and flash[:danger] = "You are already logged in!" if logged_in?
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have Logged in!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged off"
    redirect_to root_path
    
  end
  
end