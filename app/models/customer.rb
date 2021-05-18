class Customer < ApplicationRecord
	has_many :addresses, dependent: :destroy
	has_many :cart_products, dependent: :destroy
	has_many :orders, dependent: :destroy
end
