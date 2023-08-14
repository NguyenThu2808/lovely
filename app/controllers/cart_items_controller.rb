class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.create(product_id: params[:product_id],
      quantity: params[:quantity])
  end
end
