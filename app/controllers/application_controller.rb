class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_user
  before_action :load_my_cart

  def load_my_cart
    @cart_items = current_user.cart_items
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to access this page.'
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
