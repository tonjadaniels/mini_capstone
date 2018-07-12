class Category < ApplicationRecord

  has_many :product_categories
  
  has_many :products, through: :products_category

end
