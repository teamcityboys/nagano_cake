class Admins::OrdersController < ApplicationController
    def index
        @orders = Order.all.page(params[:page]).per(7)
        @total_quantity = Array.new
        for order in @orders
            order_details = OrderDetail.where(order_id: order.id)
            total_quantity = 0

            # 注文個数総計算出
            for order_detail in order_details
                total_quantity = total_quantity + order_detail.quantity.to_i
            end

            # 注文個数総数を配列に格納
            @total_quantity.push(total_quantity)
        end
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        # 商品合計の計算方法
        @order_total = 0
        @order.order_details.each do |order_detail|
        @order_total += order_detail.price * order_detail.quantity
        end
        p @order.order_status
    end

    def update
        @order = Order.find(params[:id])
        status_params[:order_status] = status_params[:order_status].to_i
        @order.update(params_int(status_params))
       if
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

    def params_int(model_params)
        model_params.each do |key,value|

            model_params[key]=value.to_i

        end
    end
end
