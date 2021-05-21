class Public::CartProductsController < ApplicationController
    def index
        # @cart_products = cart_product.all
    end

    def create

    end

    def update

    end

    def destroy
        @cart_product.destroy
        @cart_products = current_cart
        @total_money = total_price(@cart_products).to_s(:deliminated)
    end

    def destroy_all
        @cart_products = current_customer.cart_products
        @cart_products.destroy_all
        redirect_to cart_products
    end
end
