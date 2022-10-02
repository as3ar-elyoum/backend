class Product < ApplicationRecord
  attribute :active, default: false
  validates :url, presence: true, uniqueness: true

  before_update :check_price

  belongs_to :source
  belongs_to :source_page
  has_many :product_prices
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def check_price
    # ProductPrice.create(price: price, product_id: id)
    product_prices.create(price: price) if price_was != price
  end

  def scrap_details
    Scrapers::ProductDetails.new(id).perform
  rescue StandardError => e
    update(active: false)
  end
end
