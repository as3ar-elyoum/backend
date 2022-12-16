class ProductPrice < ApplicationRecord
  belongs_to :product
  validates :price, numericality: { greater_than: 0 }

  after_create :update_product_price_count, :update_change_percentage

  def update_product_price_count
    product.update_columns(prices_count: product.prices.count, price_updated_at: Time.now)
  end

  def update_change_percentage
    latest_price_record = product.prices.where.not(id:).order(id: :desc).first

    return unless latest_price_record

    latest_price = latest_price_record.price

    calculated_change_percentage = ((price - latest_price) / latest_price * 100).to_i
    update_columns(change_percentage: calculated_change_percentage)

    calculated_change_percentage
  end
end
