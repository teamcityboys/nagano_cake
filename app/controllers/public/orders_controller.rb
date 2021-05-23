class Public::OrdersController < ApplicationController
    def new

    end

    def confirm

    end

    def create

    end

    def complete

    end

    def index
         @orders = current_customer.orders
    end

    def show

    end
end
