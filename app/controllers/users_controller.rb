class UsersController < ApplicationController
  layout 'login', only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  # profile
  def edit; end

  def update
    @user.update_attributes user_params
    render :edit
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :username, :password, :first_name, :last_name
  end
end
