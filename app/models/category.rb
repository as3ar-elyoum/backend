class Category < ApplicationRecord
  validates :name, presence: true

  belongs_to :source_pages
end
