class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
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
