class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy,foreign_key: 'member_id'
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (self.is_deleted == false)
  end


  #フルネームメソッド
  def full_name
    self.last_name + self.first_name
  end

  #フルネームカナメソッド
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true

end
