class Source < ApplicationRecord
  attribute :active, default: true

  has_many :source_pages
  has_many :products

  validates :name, presence: true
  validates :url, presence: true
end
