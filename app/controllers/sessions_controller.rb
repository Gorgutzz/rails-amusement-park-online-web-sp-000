class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(:name => params[:user_name])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'sessions/new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
