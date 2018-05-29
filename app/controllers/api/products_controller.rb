class Api::ProductsController < ApplicationController
def product_action
  @products + Product.first
  render "products_view.json.jbuilder"
end
end
