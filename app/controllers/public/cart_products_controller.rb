class Public::CartProductsController < ApplicationController
    def index
    
    end
    
    def create
        @cart_product = CartProduct.new(post_product_params)
        if @cart_product.save
            redirect_to products_path
        else
            @cart_product.save!
            redirect_to home_about_path
        end
    end
    
    def update
    
    end
    
    def destroy
    
    end
    
    def destroy_all
    
    end
    
    private
    
    def post_product_params
        params.require(:cart_product).permit(:member_id, :product_id, :quantity)
    end
end
