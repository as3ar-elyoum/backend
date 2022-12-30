class ProductHitsController < ApplicationController
  def index
    @hits = ProductHit.includes(:product).order(id: :desc).last(200)
  end
end
