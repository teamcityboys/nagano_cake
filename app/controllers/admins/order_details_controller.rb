class Admins::OrderDetailsController < ApplicationController
    def update
        order_detail = OrderDetail.find(params[:id])
        order_detail.update(params_int(making_status_params))
        flash[:success] = "制作ステータスを変更しました"
        redirect_to admins_orders_path
    end
    
    private
    def making_status_params
        params.require(:order_detail).permit(:making_status)
    end
    def params_int(model_params)
        model_params.each do |key,value|
          model_params[key]=value.to_i
        end
    end
end
