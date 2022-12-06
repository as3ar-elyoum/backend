class ProductPrice < ApplicationRecord
  belongs_to :product

  after_create :update_product_price_count

  def update_product_price_count
    product.update(prices_count: product.prices.count, price_updated_at: Time.now)
  end
end
