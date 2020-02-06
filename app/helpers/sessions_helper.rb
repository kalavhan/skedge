module SessionsHelper
  def log_in(user)
    user.remember
    session[:session_token] = user.session_token
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    !@current_user.nil?
  end
end
