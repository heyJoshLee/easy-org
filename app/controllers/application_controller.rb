class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

  def require_group_admin(group_id)
    if !current_user.is_admin_of(group_id)
      flash[:danger] = "You do not have permission to do that."
      redirect_to login_path
    end
  end

  def require_membership(group_id)
    if !current_user.is_member_of(group_id)
      flash[:danger] = "You do not have permission to do that."
      redirect_to login_path
    end
  end
end