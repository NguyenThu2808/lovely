class ApplicationController < ActionController::Base
  before_action :load_my_cart

  def load_my_cart
    @cart_items = CartItem.all
  end

  def current_user
    User.find_by id: session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to access this page.'
    end
  end
end
