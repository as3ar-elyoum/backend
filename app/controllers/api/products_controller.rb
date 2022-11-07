module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[show similar]

    def index
      products_query = Product.active.includes(:source, :source_page).order('Random()')
      if params[:category_id]
        products_query = products_query
                         .joins('INNER JOIN source_pages ON source_pages.id = products.source_page_id')
                         .where('source_pages.category_id = ? ', params[:category_id])
      end

      @products = products_query.limit(50)
    end

    def show
      @prices = @product.prices.order('created_at DESC').pluck(:created_at, :price)
      @prices = @product.prices.order('created_at DESC').pluck(:created_at, :price).map do |item|
        [item.first.to_date, item.last]
      end
    end

    def similar
      @products = Products::Search.perform({ term: @product.name })
                                  .where.not(id: @product.id)
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
