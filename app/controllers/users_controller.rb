class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to me_path
      flash.now[:notice] = "Congratulations!!, new account created"
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(1)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birth_date, :email, :password)
    end
end
