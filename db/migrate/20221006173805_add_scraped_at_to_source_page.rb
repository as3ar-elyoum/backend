class AddScrapedAtToSourcePage < ActiveRecord::Migration[7.0]
  def change
    add_column :source_pages, :scraped_at, :datetime
  end
end
