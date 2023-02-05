class Category < ApplicationRecord
  has_one_attached :icon
  attribute :active, default: true 

  validates :name, presence: true
  validates :icon, presence: true

  has_many :source_pages
  has_many :products

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def icon_path
    return '' if icon.nil?

    icon.attachment.try(:blob).try(:url)
  rescue StandardError => e
    ''
  end
  
end
