class Public::HomesController < ApplicationController
  def top
    @new_products = Product.order(:create_at)
  end

  def about
  end
end
