class ProductHitsController < ApplicationController
  def index
    @hits = ProductHit.includes(:product).last(200)
  end
end
