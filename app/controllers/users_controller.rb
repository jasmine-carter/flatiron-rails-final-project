class UsersController < ApplicationController

  def new
    if !current_user
      @user = User.new
    else
      flash[:message] = "You're already signed in!"
      redirect_to current_user
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end


  def edit
  end

  def swoliest
    @user = User.swoliest
  end

  def show
    if !current_user
      redirect_to controller: 'users', action: 'new' #if user is not logged in, redirect to sign up
    else
      @user = User.find_by(id: params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
