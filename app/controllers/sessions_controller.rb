class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      keep_me if params[:session][:remember_me] == "1"
      flash.now[:notice] = "Welcome back, #{current_user.first_name}!"
      redirect_to root_path
    else
      render 'new'
    end 
  end

  def destroy
    log_out
    redirect_to signup_path unless current_user
  end
end
