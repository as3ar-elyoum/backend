class ProductsController < ApplicationController

  before_action :set_product, only: %i[show enqueueScraper]

  def index
    @products = Product.includes(:source, :source_page).order(updated_at: :desc).first(100)
  end

  def enqueueScraper
     @product.enqueue_scraper_worker
  end

  def show;end


  def set_product
    @product = Product.find(params[:id])
  end
end
