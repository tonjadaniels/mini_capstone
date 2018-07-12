class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except:[:index, :show]

    def index
      @products = Product.all
      
      name_search = params[:search]
      if name_search
        @products = Product.where("name LIKE ?", "%#{name_search}%")
      end
      
      if params[:price_sort]
        @products = @products.order(price: :asc)
      else
        @products = @products.order(id: :asc)
      end

      if params[:category]
        category = Category.find_by(name: params[:category])
        @products = category.products
      end

      render "index.json.jbuilder"
    end

    def show
      product_id = params[:id]
      @product = Product.find(product_id)
      render "show.json.jbuilder"
    end

    def create
      if current_user && current_user.admin
        @product = Product.new(
          name: params[:name],
          price: params[:price],
          image_url: params[:image_url],
          description: params[:description],
          supplier_id: params[:supplier_id]
          ) 

        if @product.save
          render "show.json.jbuilder"
        else
          render json: {errors: @product.errors.full_message}, status: :uprocessable_entity
        end
      else
        render json: {}, status: :unauthoriaed
      end
    end

    def update
      if current_user && current_user.admin
        product_id = params[:id]
        @product = Product.find(product_id)

        @product.name = params[:name] || @product.name
        @product.price = params[:price] || @product.price
        @product.image_url = params[:image_url] || @product.image_url
        @product.description = params[:description] || @product.description
        @product.supplier_id = params[:supplier_id] || @product.supplier_id

        if @product.save
          render "show.json.jbuilder"
          else
            render json: {erros: @product.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render json: {}, status: :unauthorized
      end
    end

    def destroy
      if current_user && current_user.admin
        product_id = params[:id]
        @product = Product.find(product_id)
        @product.destroy
        render json:{message: "Product successfully destroyed"}    
      else
        render json: {}, status: :unauthoriaed
      end 
    end
end