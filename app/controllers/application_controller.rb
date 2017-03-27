class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_chef, :logged_in?

  # Set current_chef as the chef with the id of autenticated chef, if any, otherwise nil
  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  # Return true/false if current_chef is set or nil
  def logged_in?
    !!current_chef
  end

  # Don't allow to perform some actions if the user is not logged in'
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
