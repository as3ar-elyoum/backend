module Api
  class ProductsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_product, only: %i[show similar update]

    def index
      filter = { filter: { status: :active, category_id: params[:category_id] } }
      @products = ProductFacade.new(filter).perform
    end

    def show
      prices =  [@product.prices.first] + @product.prices.order(change_percentage: :desc).limit(5) + [@product.prices.last]
      prices = prices.uniq.pluck(:created_at, :price)
      prices = prices.map do |item|
        [item.first.to_date, item.second]
      end

      @prices = prices.sort
    end

    def home
      @categorized_products = Products::Home.new.perform
    end

    def similar
      @products = Products::Similar.new(@product.id).perform
    end

    def update
      if @product.update(product_params)
        @product.check_similar_category
        render :show, status: :ok, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    private

    def product_params
      params.require(:product).permit(:status, :category_id)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
