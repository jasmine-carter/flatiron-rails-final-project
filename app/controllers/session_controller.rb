class SessionController < ApplicationController

  def new
    if !current_user
      @user = User.new
    else
      flash[:message] = "You're already logged in!"
      redirect_to current_user
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "User Email or Password Invalid"
      render 'new'
    end
  end

  def show
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
