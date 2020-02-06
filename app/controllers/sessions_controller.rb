class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash.now[:notice] = "Welcome back, #{current_user.name}!"
      log_in(@user)
      remember_me(current_user) if [:params][:remember_me] == "1"
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
