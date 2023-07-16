class SourcePage < ApplicationRecord
  attribute :active, default: true
  URL_REGEXP = Regexp.new("(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?")

  belongs_to :source
  belongs_to :category, required: false
  has_many :products
  has_many :logs, class_name: 'SourcePageLog'

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: URL_REGEXP }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  delegate :source_config, to: :source

  def enqueue_scraper
    return SourcePageWorker.perform_async(id) unless paginated?

    (0..max_page_numbers).to_a.shuffle.map do |number|
      SourcePageWorker.perform_async(id, number)
    end
  end
end
