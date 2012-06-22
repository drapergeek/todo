class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :require_current_user
  
  protected
  
  def require_current_user
    unless current_user
      flash[:notice] = "You must be signed in to view this page"
      redirect_to new_sessions_path
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def set_current_user(user_id)
    session[:user_id] = user_id
    User.find(session[:user_id]).set_logged_in
  end
  
  def logout_current_user
    session[:user_id] = nil
  end
end
