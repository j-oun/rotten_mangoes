class Admin::UsersController < ApplicationController
  
  before_filter :restrict_admin

  def index
    #@users = User.all
     #@user = User.new
    @user=User.find(session[:user_id])
     if @user.admin==0 
        redirect '/movies'
     end 
  end



end
