class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit scrap]

  def index
    @products = Facade::Product.load(params)
  end

  def show; end

  def edit; end

  def scrap
    @product.enqueue_scraper_worker
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
