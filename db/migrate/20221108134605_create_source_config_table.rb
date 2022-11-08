class CreateSourceConfigTable < ActiveRecord::Migration[7.0]
  def change
    create_table :source_config_tables do |t|
      t.string :price_selector
      t.string :name_selector
      t.string :image_selector
      t.string :description_selector
      t.string :product_urls_selector
      t.references :source, index: true
      t.timestamps
    end
  end
end
