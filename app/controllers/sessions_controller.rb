class SessionsController < ApplicationController
  def create
    # Find a chef who has the email used for the login
    chef = Chef.find_by(email: params[:session][:email].downcase)
    # .authenticate get a password compute its hash and compare it with the one stored in the db
    if chef && chef.authenticate(params[:session][:password])
      # define a session parameter
      session[:chef_id] = chef.id
      # it need to set cookies as well, because ActionCable doesn't work with sessions
      cookies.signed[:chef_id] = chef.id
      flash[:success] = "You have successfully logged in"
      redirect_to chef
    else
    flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end 