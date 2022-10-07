module Api
  class ProductsController < ApplicationController
    def index
      @products = Product.active.includes(:source, :source_page).order('Random()').limit(100)
    end
  end
end
