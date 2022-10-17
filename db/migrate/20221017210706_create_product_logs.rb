class CreateProductLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :product_logs do |t|
      t.string :notes
      t.references :product, index: true

      t.timestamps
    end
  end
end
