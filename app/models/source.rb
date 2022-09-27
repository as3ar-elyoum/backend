class Source < ApplicationRecord
    has_many :source_pages
    validates :name, presence: true
    validates :url, presence: true
end
