class Public::ProductsController < ApplicationController
   def index
      @products = Product.page(params[:page]).where.not(is_active: false)
   end

   def show
      @product = Product.find(params[:id])
      @cart_product = CartProduct.new
   end
end
