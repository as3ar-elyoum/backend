class Product < ApplicationRecord
  attribute :active, default: false
  validates :url, presence: true, uniqueness: true

  before_update :check_price
  after_create :enqueue_scraper_worker

  belongs_to :source
  belongs_to :source_page
  has_many :product_prices
  has_many :logs, class_name: 'ProductLog'

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def check_price
    product_prices.create(price:) if price_was != price
  end

  def enqueue_scraper_worker
    ProductDetailsWorker.perform_async(id)
  end
end
