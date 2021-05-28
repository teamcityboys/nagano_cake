class Address < ApplicationRecord
  belongs_to :customer, optional: true
  def view_porstal_code_and_address_and_name
    "〒 "+ self.porstal_code + ' ' + self.address + ' ' + self.name
  end
end
