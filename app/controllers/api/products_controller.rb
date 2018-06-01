class Api::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    # @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    render "show.json.jbuiler"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    @recipe.save
    render "show.json.jbuilder"
  end

  def destroy
    product_id = params[:id]
    @product = Product_find_by(id:product_id)
    @product.destroy
    render json:{message: "Product successfully destroyed"}
  end
end

