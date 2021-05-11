class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = Micropost.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save 
      log_in @user
      flash[:success] = "Welcome to the Twitter App!"
      redirect_to user_url(@user)
    else 
      render 'new'
    end
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end      

  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
