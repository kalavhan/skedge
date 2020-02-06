module SessionsHelper
  def log_in(user)
    user.new_session_token
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

  def keep_me
    @current_user.new_login_token
    cookies.signed[:user_id] = { value: @current_user.id, expires: 2.days.from_now }
    cookies[:login_token] = { value: @current_user.login_token, expires: 2.days.from_now }
  end

  def logout
    @current_user = nil
    cookies.signed[:user_id] = nil
    cookies
  end
end
