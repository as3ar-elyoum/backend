class Product < ApplicationRecord
  include Searchable

  attribute :active, default: false
  validates :url, :unique_identifier, presence: true, uniqueness: true

  before_update :check_price
  before_validation :set_identifier
  after_create :enqueue_scraper_worker

  enum status: { inactive: 0, active: 1, disabled: 2, duplicate: 3 }, _default: :inactive

  belongs_to :source
  belongs_to :source_page
  has_many :prices, class_name: 'ProductPrice'
  has_many :logs, class_name: 'ProductLog'

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def set_identifier
    self.unique_identifier ||= url[%r{dp/[a-zA-Z0-9]+}] || url
  end

  def check_price
    prices.create(price:) if price_was != price
  end

  def enqueue_scraper_worker
    ProductDetailsWorker.perform_async(id)
  end
end
