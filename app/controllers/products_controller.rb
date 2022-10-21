class ProductsController < ApplicationController
  before_action :set_product, only: %i[show scrap]

  def index
    @products = Product.includes(:source, :source_page).order(updated_at: :desc).first(100)
  end

  def show
    render json: { prices: @product.prices }
  end

  def scrap
    @product.enqueue_scraper_worker
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
