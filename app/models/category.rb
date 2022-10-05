class Category < ApplicationRecord
  validates :name, presence: true

  has_many :source_pages
end
