class SourcePage < ApplicationRecord
  belongs_to :source
  validates :name, presence: true
  validates :url, presence: true
end
