class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
   #フルネームメソッド
  def full_name
    self.last_name + self.first_name
  end
end
