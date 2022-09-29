class Product < ApplicationRecord
  attribute :active, default: false
  validates :url, presence: true, uniqueness: true

  before_update :check_price

  belongs_to :source
  belongs_to :source_page
  has_many :product_prices

  def check_price
    # ProductPrice.create(price: price, product_id: id)
    product_prices.create(price: price) if price_was != price
  end
end
