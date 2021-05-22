class Admins::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        # 商品合計の計算方法
        @order_total = 0
        @order.order_details.each do |order_detail|
            @order_total += order_details.price * order_details.quantity
        end
    end

    def update
        @order = Order.find(params[:id])
       if @order.update(order_params)
           flash[:success] = "注文ステータスを変更しました"
           redirect_to admins_orders_path
       else
           render :show
       end

    end

    private
    def status_params
        params.require(:order).permit(:order_status)
    end
end
