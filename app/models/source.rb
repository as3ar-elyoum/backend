class Source < ApplicationRecord
  attribute :active, default: true

  has_many :source_pages, dependent: :destroy
  has_many :products

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  def parsed_selectors
    JSON.parse(selectors)
  end
end
