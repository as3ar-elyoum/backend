class Product < ApplicationRecord
  include Searchable

  attribute :active, default: false
  validates :url, presence: true, uniqueness: true

  before_update :check_price
  after_create :enqueue_scraper_worker

  belongs_to :source
  belongs_to :source_page
  has_many :prices, class_name: 'ProductPrice'
  has_many :logs, class_name: 'ProductLog'

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def check_price
    prices.create(price:) if price_was != price
  end

  def enqueue_scraper_worker
    ProductDetailsWorker.perform_async(id)
  end
end
