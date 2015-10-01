class Admin::UsersController < ApplicationController
  
  before_filter :restrict_admin

  def index
    @users = User.page(params[:page]).per(10)
    
    @user_session=User.find(session[:user_id])
     if @user_session.admin==0 
        redirect '/movies'
     end 
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


end
