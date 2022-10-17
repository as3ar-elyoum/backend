class SourcePage < ApplicationRecord
  attribute :active, default: true

  belongs_to :source
  belongs_to :category, required: false
  has_many :products

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def parsed_selectors
    JSON.parse(source.selectors)
  end

  def enqueue_scraper
    return SourcePageWorker.perform_async(id) unless paginated?

    (0..500).to_a.shuffle.map do |number|
      SourcePageWorker.perform_async(id, number)
    end
  end
end
