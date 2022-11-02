class AddUniqueIdentifierToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :unique_identifier, :string
    add_index :products, :unique_identifier, unique: true
  end
end
