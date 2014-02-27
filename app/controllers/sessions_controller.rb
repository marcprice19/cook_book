class SessionsController < ApplicationController

  def new
  
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.try(:authenticate, params[:password])
      session[:current_user] = @user
      redirect_to root_path, notice: "Logged in yo"
    else
      flash[:alert] = "Wrong info yo. U tryin to hack?"
      render :new  
    end  
  end

  def logout
    reset_session
    redirect_to root_path, notice: 'See ya later yo'
  end
end
