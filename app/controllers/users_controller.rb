class UsersController < ApplicationController
  def new
    @new = User.new
    @user = User.all
  end
  def create
    @new = User.new(:name => params[:user][:name])
    if @new[:name].strip != "" && !User.exists?(:name => @new[:name]) then
      @new.save
    end
    @user = User.all
    render action: :new
  end
end
