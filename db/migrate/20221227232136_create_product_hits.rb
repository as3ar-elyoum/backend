class CreateProductHits < ActiveRecord::Migration[7.0]
  def change
    create_table :product_hits do |t|
      t.references :device, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
