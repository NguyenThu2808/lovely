class ProductsController < ApplicationController
  before_action :require_login, only: :show

  def index
    @products = Product.page(params[:page]).per 9

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :not_found # Xử lý khi không tìm thấy bản ghi
    end
  end
end
