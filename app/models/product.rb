class Product < ApplicationRecord
  include Searchable

  validates :url, :unique_identifier, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }, on: :update

  before_update :check_price
  before_validation :set_identifier
  after_create :enqueue_scraper_worker
  after_update :check_category

  enum status: { inactive: 0, active: 1, disabled: 2, duplicate: 3 }, _default: :inactive

  belongs_to :source
  belongs_to :source_page, required: false
  belongs_to :category, required: false
  has_many :prices, class_name: 'ProductPrice', dependent: :destroy
  has_many :logs, class_name: 'ProductLog'

  scope :enabled, -> { where.not(status: [statuses[:disabled], statuses[:duplicate]]) }
  scope :categorized, -> { where.not(category_id: nil) }
  scope :uncategorized, -> { where(category_id: nil) }

  def set_identifier
    self.unique_identifier ||= url[%r{dp/[a-zA-Z0-9]+}] || url
  end

  def check_price
    prices.create(price:) if price_was != price
  end

  def enqueue_scraper_worker
    ProductDetailsWorker.perform_async(id)
  end

  def indexable?
    active? && categorized?
  end

  def categorized?
    !category_id.nil?
  end

  def check_category
    similars = Products::Search.new(product.name).perform
    similars.update_all(category_id:)
  end
end
