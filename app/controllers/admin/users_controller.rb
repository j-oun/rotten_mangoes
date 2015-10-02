class Admin::UsersController < ApplicationController
  
  before_filter :restrict_admin
  before_filter :find_user, except: [:index, :new, :create]

  def index
    @users = User.page(params[:page]).per(10)
    
    @user_session = User.find(session[:user_id])
     if @user_session.admin == 0  
        redirect '/movies'
     end 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "User created"
    else
      flash[:alert] = "Failed to create user"
      render :edit
    end
  end

  def update
    if @user.update user_params
      redirect_to admin_users_path
    else
      flash[:alert] = "Failed to update user"
      render :edit
    end
  end

  def new
    @user = User.new
    render :edit
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname)
  end

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
end