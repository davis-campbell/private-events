class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    User.find(cookies[:user_id]) unless cookies[:user_id].nil?
  end
  
  def login(user)
    cookies.permanent[:user_id] = user.id
  end
  
  def logout(user)
    cookies.delete(:user_id)
    redirect_to login_path
  end
end
