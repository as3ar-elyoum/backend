class Category < ApplicationRecord
  validates :name, presence: true

  has_many :source_pages

  validates :icon, presence: true

  def icon_path
    icon.attachment.try(:blob).try(:url)
  end
