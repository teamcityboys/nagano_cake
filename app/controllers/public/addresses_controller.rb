class Public::AddressesController < ApplicationController
    def index

      @addresses = current_customer.addresses
      @address = Address.new
    end

    def edit
        @address = Address.find(params[:id])
    end

    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to addresses_path
    end

    def create
      @address = Address.new(address_params)
      @address.mamber_id = current_customer.id
      @address.save
      redirect_to addresses_path
    end

    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to addresses_path
    end

    private
    def address_params
        params.require(:address).permit(:porstal_code, :address, :name)
    end

end
