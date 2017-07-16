class User < ApplicationRecord
  has_secure_password
  has_many :orders

 validates :password_digest, length: { in: 6..20 }
 validates :email, uniqueness: { case_sensitive: false }

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
