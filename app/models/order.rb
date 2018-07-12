class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :carted_products
  has_many :products, through: :carted_products

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  def calculated_subtotal
    product.price * quantity.to_i
  end

  def calculated_tax
    calculated_subtotal * 0.09
  end

  def calculated_total
    calculated_subtotal + calculated_tax
  end

end
