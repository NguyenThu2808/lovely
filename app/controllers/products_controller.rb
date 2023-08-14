class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per 9

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
