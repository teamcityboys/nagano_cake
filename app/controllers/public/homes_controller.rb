class Public::HomesController < ApplicationController
  def top
    @new_products = Product.order(:create_at).where.not(is_active: false)
  end

  def about
  end
end
