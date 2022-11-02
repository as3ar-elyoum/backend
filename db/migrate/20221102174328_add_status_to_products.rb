class AddStatusToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :integer
    add_index :products, :status
  end
end
