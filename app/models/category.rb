class Category < ApplicationRecord
  has_one_attached :icon

  validates :name, presence: true

  has_many :source_pages

  validates :icon, presence: true

  def icon_path
    return '' if icon.nil?

    icon.attachment.try(:blob).try(:url)
  rescue StandardError => e
    ''
  end
end
