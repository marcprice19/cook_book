class UsersController < ApplicationController

  def new
    reset_session #keeps the user from creating when they are signed in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You are signed in yo'
    else
      flash[:alert] = 'You were not signed in yo'
      render :new 
    end  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
