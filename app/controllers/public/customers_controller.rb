class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def withdraw

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def hide

  end

  private
  def customer_params
    params.require(:customer).permit(:email,:last_name,:last_name_kana,:first_name,:first_name_kana,:address,:porstal_code,:phone_number)
  end
end
