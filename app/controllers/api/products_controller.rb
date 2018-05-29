class Api::ProductsController < ApplicationController
  
  def products_action
    @products = Product.all
    render "products_view.json.jbuilder"
  end
end
