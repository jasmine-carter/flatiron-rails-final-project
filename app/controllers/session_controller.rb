class SessionController < ApplicationController

  def new

  end

  def create
  end

  def show
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  
end
