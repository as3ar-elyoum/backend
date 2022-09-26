class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.string :image_url
      t.text :description
      t.datetime :scraped_at
      t.decimal :price
      t.boolean :active

      t.references :source, index: true
      t.references :source_page, index: true

      t.timestamps
    end
  end
end
