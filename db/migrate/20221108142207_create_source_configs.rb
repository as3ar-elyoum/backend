class CreateSourceConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :source_configs do |t|
      t.string :name_selector
      t.string :price_selector
      t.string :description_selector
      t.string :image_url_selector
      t.string :products_url_selector

      t.references :source, index: true
      t.timestamps
    end
  end
end
