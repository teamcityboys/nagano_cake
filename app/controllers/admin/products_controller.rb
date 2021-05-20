class Admin::ProductsController < ApplicationController
    def index
     @products = Product.all
    end

    def new
     @product = Product.new
    end

    def create
     @product = Product.new(product_params)
     if @product.save
         flash[:notice] = "You have created Product successfully"
       redirect_to admin_product_path(@product.id)
     else
         render :new
     end
    end

    def show
     @product = Product.find(params[:id])
     @include_tax_price = (@product.price * 1.1).floor
    end
     

    def edit
     @product = Product.find(params[:id])
    end

    def update
     @product = Product.find(params[:id])
     if @product.update(product_params)
         flash[:notice] = "You have update Item successfully"
       redirect_to admin_product_path(@product.id)
     else
       render :edit
     end
    end

    # def tax_price
     # price * 1.1
    # end

    private
    def product_params
     params.require(:product).permit(:genre_id, :name, :describe, :price, :image, :is_active)  #ここ教えてもらう
    end

end
