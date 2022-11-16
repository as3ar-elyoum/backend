class ProductsController < ApplicationController
  before_action :fetch_product, only: %i[show edit scrap update]

  def index
    @products = ProductFacade.new(params).perform
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: 'Product was successfully updated.'
    end
  end

  def scrap
    @product.enqueue_scraper_worker
  end

  private

  def product_params
    params.require(:product).permit(:status, :category_id)
  end

  def fetch_product
    @product = Product.find(params[:id])
  end
end
