class SourcePage < ApplicationRecord
  attribute :active, default: true
  URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

  belongs_to :source
  belongs_to :category, required: false
  has_many :products
  has_many :logs, class_name: 'SourcePageLog'

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  delegate :parsed_selectors, to: :source

  def enqueue_scraper
    return SourcePageWorker.perform_async(id) unless paginated?

    (0..max_page_numbers).to_a.shuffle.map do |number|
      SourcePageWorker.perform_async(id, number)
    end
  end
end
