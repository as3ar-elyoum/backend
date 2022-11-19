module Api
  class ProductsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_product, only: %i[show similar update]

    def index
      filter = { filter: { category_id: params[:category_id] } }
      @products = ProductFacade.new(filter).perform
    end

    def show
      @prices = @product.prices.order('created_at DESC').pluck(:created_at, :price).map do |item|
        [item.first.to_date, item.last]
      end
    end

    def similar
      @products = Products::Similar.new(@product.id).perform
    end

    def update
      if @product.update(product_params)
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
