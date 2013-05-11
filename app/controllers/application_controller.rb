class ApplicationController < ActionController::Base
before_filter :require_user
before_filter :require_admin
  protect_from_forgery

  def current_user
    if @current_user.nil?
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end
  end
  helper_method :current_user

  #before every other request, check if user is logged into session
  #doesn't matter for the login, sign up page. exceptions for those pages.
  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end

  def require_admin
    if @current_user
      redirect_to root_url unless @current_user.role == 'Admin'
    #end
    #return @user && self.role == 'Admin'
    #@user.role?(:Admin)
  end
  end
end
