class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_products,foreign_key: 'member_id'
  has_many :order_details, dependent: :destroy
end
