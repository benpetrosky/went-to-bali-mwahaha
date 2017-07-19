class Product < ApplicationRecord
  has_many :order_items

  validates :description, presence: true , length: { in: 50..200 }
  validates :price, presence: true

end
