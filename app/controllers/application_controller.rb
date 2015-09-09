class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_user
    if session[:admin_id]
      @admin_user ||= Admin.find(session[:admin_id])
    end
  end

  helper_method :admin_user
end
