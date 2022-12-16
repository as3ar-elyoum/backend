class AddChangePercentageToProductPrices < ActiveRecord::Migration[7.0]
  def change
    add_column :product_prices, :change_percentage, :integer, default: 0
  end
end
