class UsersController < ApplicationController
  def new
    if admin_user != nil then
      @new = User.new
      @user = User.all
    else
      redirect_to "/admin"
    end
  end
  def create
    if admin_user != nil then
      @new = User.new(:name => params[:user][:name])
      if @new[:name].strip != "" && !User.exists?(:name => @new[:name]) then
        @new.save
      end
      @user = User.all
      render action: :new
    else
      redirect_to "/admin"
    end
  end

end
