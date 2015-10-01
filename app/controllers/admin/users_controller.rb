class Admin::UsersController < ApplicationController
  
  before_filter :restrict_admin

  def index
    @users = User.page(params[:page]).per(10)
    
    @user=User.find(session[:user_id])
     if @user.admin==0 
        redirect '/movies'
     end 
  end



end
