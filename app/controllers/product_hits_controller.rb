class ProductHitsController < ApplicationController
  def index
    @hits = ProductHit.includes(:product).order(id: :desc).first(200)
  end
end
