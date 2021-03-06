class SessionsController < ApplicationController

  def new
    if !current_user
      @user = User.new
    else
      flash[:message] = "You're already logged in!"
      redirect_to current_user
    end
  end

  def create
    if request.env["omniauth.auth"]
      @oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if  @user = User.find_by(email: request.env["omniauth.auth"]["info"]["email"])
        session[:user_id] = @user.id
        redirect_to @user
      else
        @user = User.create(email: @oauth_email, name: @oauth_email = request.env["omniauth.auth"]["info"]["name"], password: SecureRandom.hex)
        @user.save
        session[:user_id] = @user.id
        redirect_to @user
      end
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:message] = "User Email or Password Invalid"
        redirect_to signin_path
      end
      end
    end


  def show
  end

  def destroy #question during session, is it better to define the action as delete and define the route like delete '/logout', to: 'sessions#destroy'
    #or to set routes under collection routes and change the action name to logout?
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
