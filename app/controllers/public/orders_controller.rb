class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @addresses = Address.where(mamber_id: current_customer.id)
    end

    def confirm
        @cart_products = current_customer.cart_products

        # カート内金額総計算出
        sum = 0
        for cart_product in @cart_products
            sum += cart_product.product.price * cart_product.quantity
        end

        if post_order_params[:destination_type].to_i == 0           #ご自身の住所
            @order = Order.new
            @order.porstal_code = current_customer.porstal_code
            @order.address = current_customer.address
            @order.name = current_customer.last_name + current_customer.first_name
            @order.customer_id = current_customer.id
            @order.freight = 800
            @order.charge = (sum * 1.1).floor
            @order.payment_method = post_order_params[:payment_method].to_i
        elsif post_order_params[:destination_type].to_i == 1        #登録先住所から選択
            address = Address.find(post_order_params[:addresses])
            @order = Order.new
            @order.porstal_code = address.porstal_code
            @order.address = address.address
            @order.name = address.name
            @order.customer_id = current_customer.id
            @order.freight = 800
            @order.charge = (sum * 1.1).floor
            @order.payment_method = post_order_params[:payment_method].to_i
        else                                                        #新しいお届け先
            @order = Order.new
            @order.porstal_code = post_order_params[:porstal_code]
            @order.address = post_order_params[:address]
            @order.name = post_order_params[:name]
            @order.customer_id = current_customer.id
            @order.freight = 800
            @order.charge = (sum * 1.1).floor
            @order.payment_method = post_order_params[:payment_method].to_i
        end

        session[:posts] = @order
    end

    def create

    end

    def complete
        ActiveRecord::Base.transaction do
            order = Order.new(session[:posts])
            order.save!

            cart_products = current_customer.cart_products
            for cart_product in cart_products
                order_detail = OrderDetail.new
                order_detail.order_id = order.id
                order_detail.product_id = cart_product.product_id
                order_detail.price = (cart_product.product.price.to_i * 1.1).floor
                order_detail.quantity = cart_product.quantity

                order_detail.save!
            end

            cart_products = current_customer.cart_products
            cart_products.destroy_all
        end
    end

    def index
         @orders = current_customer.orders
    end

    def show

    end

    private

    def post_order_params
        params.require(:order).permit(:payment_method, :destination_type, :addresses, :porstal_code, :address, :name)
    end
end
