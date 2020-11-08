class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    @user.save
    redirect_to @user
  end


  def edit
  end

  def show
    #build out current user method to check if user is logged in, if not, redirect to new user view
    @user = User.find_by(id: params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
