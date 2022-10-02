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
    product_prices.create(price: price) if price_was != price
  end

  def enqueue_scraper_worker
    ProductDetailsWorker.perform_async(id)
  end
end
