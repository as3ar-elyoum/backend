module Api
  class ProductsController < ApplicationController
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
      # product data in an object
      # in the product object => last month prices
    end
  end
end
