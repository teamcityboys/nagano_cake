class Public::CartProductsController < ApplicationController
    def index
        @cart_products = current_customer.cart_products
    end

    def create
        @cart_product = CartProduct.new(post_product_params)
        @cart_product.member_id = current_customer.id
        if @cart_product.save
            redirect_to cart_products_path
        else
            redirect_to product_path(@cart_product.product_id)
        end
    end

    def update
        @cart_product = CartProduct.find(params[:id])
        @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
        redirect_to cart_products_path
    end

    def destroy
        @cart_product = CartProduct.find(params[:id])
        @cart_product.destroy
        redirect_to cart_products_path
    end

    def destroy_all
        @cart_products = current_customer.cart_products
        @cart_products.destroy_all
        redirect_to cart_products_path
    end

    private

    def post_product_params
        params.require(:cart_product).permit(:member_id, :product_id, :quantity)
    end
end
