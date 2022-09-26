class CreateProductPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :product_prices do |t|
      t.references :product, index: true
      t.decimal :price

      t.timestamps
    end
  end
end
