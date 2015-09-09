class LoginController < ApplicationController
  def index
    @admin = true
  end
  def login
    @admin = true
    admin = Admin.limit(1)
    if admin && admin[0].authenticate(params[:pass]) then
      session[:admin_id] = admin[0].id
      redirect_to "/"
    else
      @admin = false
      render action: :index
    end
  end
end
