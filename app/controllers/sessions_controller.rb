class SessionsController < ApplicationController
  layout "login"
  before_action :require_login, only: :destroy

  def new
    @user = User.new
  end

  def create
    user = User.find_by username: params[:user][:username]

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  # private

  # def require_login
  #   unless @current_user
  #     redirect_to login_path, alert: 'You must be logged in to access this page.'
  #   end
  # end
end
