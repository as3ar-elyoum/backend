class AddPricesCountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :prices_count, :integer
  end
end
