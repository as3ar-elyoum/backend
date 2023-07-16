class Source < ApplicationRecord
  attribute :active, default: true
  URL_REGEXP = Regexp.new("(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?")

  has_many :source_pages, dependent: :destroy
  has_many :products
  has_one :source_config
  accepts_nested_attributes_for :source_config, allow_destroy: true, update_only: true

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }
  validates :url_prefix, format: { with: URL_REGEXP },
                         if: ->(object) { object.url_prefix.present? }
  def enqueue_scraper
    source_pages.active.map(&:enqueue_scraper)
  end
end
