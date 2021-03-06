class Admins::ProductsController < ApplicationController
    def index
     @products = Product.all.page(params[:page]).per(7)
     # 1ページに10件のレコードを表示
    end

    def new
     @product = Product.new
    end

    def create
     @product = Product.new(product_params)
     if @product.save
         flash[:notice] = "You have created Product successfully"
       redirect_to admins_product_path(@product.id)
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
       redirect_to admins_product_path(@product.id)
     else
       render :edit
     end
    end

    def destroy
     @product = Product.find(params[:id])
     @product.destroy
     redirect_to admins_products_path
    end

    # def tax_price
     # price * 1.1
    # end

    private
    def product_params
     params.require(:product).permit(:genre_id, :name, :describe, :price, :image, :is_active)  #ここ教えてもらう
    end

end
