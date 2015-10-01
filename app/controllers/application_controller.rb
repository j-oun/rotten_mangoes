class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected

  def restrict_access
    redirect_to login_path, alert: "You must log in." unless current_user
  end

  def restrict_admin
    restrict_access
    redirect_to '/', alert: "You are not an admin" unless current_user.admin
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
