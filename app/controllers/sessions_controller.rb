class SessionsController < ApplicationController
    
  def new
  end
  
  def create
    @user = User.find_by(name: params[:name])
    if @user
      cookies.permanent[:user_id] = @user.id
      redirect_to @user
    end
  end

  def destroy
    @user = current_user
    logout(@user)
  end

end
