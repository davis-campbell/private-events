class UsersController < ApplicationController
  before_action { @current_user = current_user }
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
