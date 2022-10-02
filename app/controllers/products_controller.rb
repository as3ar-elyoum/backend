class ProductsController < ApplicationController
  def index
    @products = Product.includes(:source, :source_page).order(updated_at: :desc).all
  end
end
