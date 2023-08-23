class CartItemsController < ApplicationController
  before_action :require_login

  def create
    product = Product.find(params[:slug])
    @cart_item = CartItem.where(product_id: product.id, session_id: session[:user_id]).last # active

    if @cart_item.present?
      new_quantity = @cart_item.quantity + params[:quantity].to_i
      @cart_item.update(quantity: new_quantity, price: product.price*new_quantity)
    else
      @cart_item = CartItem.create(product_id: product.id,
        quantity: params[:quantity], price: product.price * params[:quantity].to_i,
        session_id: session[:user_id])
    end
    # , size: params[:size], color: params[:color]
  end

  def index
    @cart_items = current_user.cart_items
    session[:booking] = nil
  end

  def set_session_cart
    session[:booking] = {cart_ids: params[:cart_ids]}
  end

  def set_session_address
    session[:booking].merge!({address: {fullname: params[:fullname],
      mobile_number: params[:mobile_number], city: params[:city],
      postcode: params[:postcode]}})

    respond_to do |format|
      format.json { render json: {fullname: params[:fullname]}}
    end
  end

  def destroy
    CartItem.find_by(id: params[:id], session_id: session[:user_id]).destroy
  end
end
