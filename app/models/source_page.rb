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
    JSON.parse(selectors)
  end

  def enqueue_scraper
    SourcePageWorker.perform_async(id)
  end
end
