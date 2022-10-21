class Source < ApplicationRecord
  attribute :active, default: true
  URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  has_many :source_pages, dependent: :destroy
  has_many :products

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }
  validates :url_prefix, format: { with: URL_REGEXP },
                         if: ->(object) { object.url_prefix.present? }

  def parsed_selectors
    JSON.parse(selectors)
  end

  def enqueue_scraper
    source_pages.active.map(&:enqueue_scraper)
  end
end
