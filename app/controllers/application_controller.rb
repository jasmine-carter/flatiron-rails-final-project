class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user
  end

  def require_login
    unless logged_in?
      flash[:message] = "You must be logged in to access this section"
      redirect_to new_user_path
    end
  end

end
