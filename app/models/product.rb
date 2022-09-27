class Product < ApplicationRecord
  attribute :active, default: false
  validates :url, presence: true, uniqueness: true

  belongs_to :source
  belongs_to :source_page
end
