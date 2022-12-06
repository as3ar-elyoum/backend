class AddPriceUpdatedAtToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :price_updated_at, :datetime
  end
end
