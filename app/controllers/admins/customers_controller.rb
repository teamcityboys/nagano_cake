class Admins::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
   
    def show
        @customer = Customer.find(params[:id])
    end
   
    def edit
         @customer = Customer.find(params[:id])
    end
    
    def update
         @customer = Customer.find(params[:id])
         @customer.update(customer_params)
         render show 
    end
    
    private
    def customer_params
        params.require(:customer).permit(
            :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :address, :porstal_code, :phone_number,)
    end

end
